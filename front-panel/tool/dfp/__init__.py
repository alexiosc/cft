ALL = []

import re
import sys
import time
import serial


class TimeoutException(BaseException):
    """Timeout while talking to the FlashProg."""
    pass


class ChecksumError(BaseException):
    """Failed to match the expected checksum for a read block."""
    pass


class FlashProgError(BaseException):
    """Error code received from FlashProg hardware."""
    pass


class UnsupportedFeature(BaseException):
    """The requested function cannot be performed because this version
    of the flash programmer is missing the required feature(s)."""
    pass


class NumberFormatError(BaseException):
    """A number reported by the DFP was in an unrecognised format."""
    pass


class ProtocolError(BaseException):
    """There was an error in the DFP protocol."""
    pass


class Base(object):
    """Base class with common tools."""


class Communication(Base):
    """Implement serial communications and methods to facilitate the
    lowest level of communications with the DFP."""

    REGEXP_PROMPT = '^.*?>\s*'

    def __init__(self, port, rate, timeout=5, slow=False, debug_io=False):
        Base.__init__(self)

        self.port = port
        self.rate = rate
        self.timeout = timeout
        self.slow = slow
        self.debug_io = debug_io

        try:
            self.ser = serial.Serial(self.port, self.rate, timeout=self.timeout)
        except serial.serialutil.SerialException as e:
            raise RuntimeError(str(e))
            


    # Low level methods

    def send(self, s):
        """Write a string to the serial port (with debugging)."""
        if self.debug_io:
            sys.stderr.write('\033[0;1;33mOUT: "%s"\033[0m\n' % visible_escapes(s))
        if self.slow:
            for c in s.encode('utf8'):
                self.ser.write(chr(c).encode('utf8'))
                time.sleep(0.001)
            self.ser.flush()
        else:
            self.ser.write(s.encode('utf8'))

        
    def scavenge_state(self, response):
        """Scan responses for interesting info and update our status."""
        #raise RuntimeError("Pure abstract method")


    # Mid-level methods
            
    def expect(self, until, update_state=True, strip_vt100=False):
        """Read status responses from the DFP serial port."""
        def _read_response():
            while True:
                line = self.ser.readline().decode('utf8')
                # Remove errant escape sequences.
                line = re.sub('\033\[.+?m', '', line)
                if len(line) == 0:
                    raise TimeoutException("Timeout waiting for results.")
                if strip_vt100:
                    line = strip_escapes(line)
                if self.debug_io:
                    if until is not None:
                        sys.stderr.write('\033[0;1;32mIN:  (until %s) "%s"\033[0m\n' %
                                         (until, visible_escapes(line.rstrip())))
                    else:
                        sys.stderr.write('\033[0;1;32mIN:  "%s"\033[0m\n' %
                                         visible_escapes(line.rstrip()))
                if line:
                    x = re.match(self.REGEXP_PROMPT, line)
                    if x:
                        # Found a prompt.
                        if until is None:
                            return
                    datum = self.grok_result(line.strip().replace('\r', ''))
                    # if self.debug:
                    #     sys.stderr.write(str(datum) + '\n')
                    if update_state:
                        self.scavenge_state(datum)
                    yield datum
                    try:
                        if datum['result'] in range(400, 500):
                            raise FlashProgError(datum)
                        if datum['result'] == until:
                            return
                    except TypeError:
                        pass
                if line is None:
                    raise TimeoutException("Timeout waiting for results.")

        return list(_read_response())


    def initiate(self):
        """Initiate communications: abort current command (just in
        case) and disable echo and terminal mode.
        """
        # Drain all input
        try:
            print("Draining...")
            while True:
                self.expect(None, update_state=False)
        except TimeoutException:
            # Nothing left in the input buffer. That's good.
            pass

        for i in range(3):
            print("Initiating...")
            try:
                self.send('\036')
                res = self.expect(299)
                print(res)
                if res[-1]['result'] == 299:
                    print("DONE")
                    return
            except TimeoutException:
                continue


    def get_prompt(self, initiate_on_fail=True):
        """Ensure we're at a prompt.
        """
        print("GET PROMPT")
        for i in range(3):
            try:
                self.send('\003')
                res = self.expect(None, strip_vt100=True)
                print(res)
                return
            except TimeoutException:
                continue
        if initiate_on_fail:
            self.initiate()
            self.get_prompt(initiate_on_fail=False)


    def ping(self):
        """Ensure the DFP is awake and listening
        """
        # Try pinging the programmer up to three times.

        for i in range(3):
            try:
                self.cmd('', until=200)
                return

            except TimeoutException:
                sys.stderr.write("Timeout, trying again...\n")
                continue

            raise UnableToCommunicate("Unable to communicate with the FlashProg.")


    def cmd(self, cmd, arg=None, retry=1, get_prompt=True, until=None):
        """Issue a command, and read its output until a particular
        output code is seen. Yield output data one by one.
        """
        for n in range(retry):
            try:
                # Ensure we're at a prompt
                if get_prompt:
                    self.get_prompt()

                if arg is not None:
                    self.send(cmd + ' ' + str(arg) + '\n')
                else:
                    self.send(cmd + '\n')
                
                return self.expect(until, strip_vt100=True)

            except TimeoutException:
                print("Retrying... (%d of %d)" % (n + 1, retry))
                continue


def strip_escapes(s):
    """Remove some terminal escape sequences from the string."""
    return re.sub('\033\[.+?m', '', s)


def visible_escapes(s):
    """Make control characters visible."""
    return re.sub('[\001-\037]', lambda x: r'\%03o' % ord(x.group()[0]), s)


# End of file.
