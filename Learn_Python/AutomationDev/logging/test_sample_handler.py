import logging
import colorlog
from colorlog.colorlog import ColoredFormatter

delimiter = "===================="

fmt = "\n%(log_color)s%(asctime)s %(name)s %(levelname)s %(message)s"
datefmt = "%Y:%m:%d %H:%M:%S"
default_log_colors = {
    "NOTSET": "white",
    "DEBUG": "blue",
    "INFO": "green",
    "STEP": "bold_blank",
    "WARNING": "bold_yellow",
    "ERROR": "bold_red",
    "CRITICAL": "bold_red",
}

# Set log file and format log for log file.
logging.basicConfig(format='%(asctime)s %(name)s %(levelname)s %(message)s', filename='example.log', level=logging.DEBUG, datefmt=datefmt)

# create logger
logger = logging.getLogger('Thao Nguyen') # It will print on log if we add %(name)s in formatter
logger.setLevel(logging.DEBUG)

# create console handler and set level to debug
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)

print("Current logging.level: {}".format(ch.level))

# add formatter to ch to handler on consol.
ch.setFormatter(
                ColoredFormatter(
                    fmt=fmt,
                    datefmt=datefmt,
                    log_colors=default_log_colors,
                )
            )

# add ch to logger
logger.addHandler(ch)

def info(*args, **kwargs):
    """Print a colored message with INFO level."""
    logger.info(*args, **kwargs)

def debug(*args, **kwargs):
    """Print a colored message with debug level."""
    logger.debug(*args, **kwargs)

def warning(*args, **kwargs):
    """Print a colored message with warning level."""
    logger.warning(*args, **kwargs)

def trace(msg):
    """Print a colored message with TRACE level."""
    logging.root.log(0, msg)

def step(msg, *args, **kwargs):
    """Print a colored message with INFO level surrounded by a delimiter."""
    new_msg = "%s %s%s%s %s" % (
        delimiter,
        colorlog.escape_codes["bold"],
        msg,
        colorlog.escape_codes["thin"],
        delimiter,
    )
