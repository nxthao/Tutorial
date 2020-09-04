import logging
import test

def main():
	logging.basicConfig(format='%(asctime)s %(levelname)s: %(message)s', filename='example.log',level=logging.DEBUG, datefmt='%Y:%m:%d %H:%M:%S')
	logging.info("Start test")
	test.do_something()
        a = 10
        logging.warning("Value: %d" %a) 
	logging.info("Finish test")

if __name__ == '__main__':
	main()

result in file example.log:
2020:09:04 16:09:52 INFO: Start test
2020:09:04 16:09:52 INFO: Doing something
2020:09:04 16:09:52 WARNING: Value: 10
2020:09:04 16:09:52 INFO: Finish test
