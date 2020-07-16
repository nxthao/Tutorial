import pytest


@pytest.fixture
def clean():
	print("\rInitial variable")
	a = 2
	b = 3
	yield [a, b]
	print("clean code")
	a = 0
	b =0
