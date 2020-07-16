import pytest

def test_add(clean):
	paramater = clean
	print("Main test")
	total = paramater[0] + paramater[1]
	print("Total: %d" % total)
