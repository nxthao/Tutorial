import pytest

@pytest.fixture(scope="function")
def function_fixture():
	print("Call function fixture")
	yield
	print("Teardown function fixture")


@pytest.fixture(scope="module")
def module_fixture():
	print("Call module fixture")
	yield
	print("Teardown module fixture")


@pytest.fixture(scope="session")
def session_fixture():
	print("Call session fixture")
	yield
	print("Teardown session fixture")


@pytest.fixture(autouse=True)
def autouse_fixture():
	print("Call autouse fixture")
	yield
	print("Teardown autouse fixture")


@pytest.fixture
def no_parameter():
	print("Call no parameter")
	yield
	print("Teardown no parameter fixture")


def test_order(no_parameter, function_fixture, module_fixture, session_fixture):
	print("Main test")

