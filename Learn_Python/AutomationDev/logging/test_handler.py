import test_sample_handler

def do_something():
	test_sample.info("Doing something")
	test_sample.step("Work with step log")
	test_sample.debug("Work with debug log")
	test_sample.warning("Work with warning log")
	test_sample.trace("Trace log")

do_something()

// result in log file: example.log
2020:09:08 15:34:39 Thao Nguyen INFO Doing something
2020:09:08 15:34:39 Thao Nguyen INFO ==================== [01mWork with step log[02m ====================
2020:09:08 15:34:39 Thao Nguyen DEBUG Work with debug log
2020:09:08 15:34:39 Thao Nguyen WARNING Work with warning log

