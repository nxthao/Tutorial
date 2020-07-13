import pytest

@pytest.fixture
def add(request):
	marker = request.node.get_closest_marker("data")
	if marker is None:
		# Handle missing marker in some way.
		x = None
		y = None
	else:
		x = marker.args[0]
		y = marker.args[1]

	result = x + y
	print(x)
	print(y)
	return result


@pytest.mark.data(2,3)
def test_add(add):
	assert add == 10
