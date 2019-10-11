#include "pch.h"
#include <iostream>
#include <cstdint>

using namespace std;

class RGBA
{
	std::uint_fast8_t m_red;
	std::uint_fast8_t m_green;
	std::uint_fast8_t m_blue;
	std::uint_fast8_t m_alpha;
public:
	RGBA(std::uint_fast8_t red, std::uint_fast8_t green, std::uint_fast8_t blue, std::uint_fast8_t alpha = 255)
		: m_red(red), m_green(green), m_blue(blue), m_alpha(alpha)
	{

	}

	void print()
	{
		cout << "Red: " << static_cast<int>(m_red) << endl;
		cout << "Green: " << static_cast<int>(m_green) << endl;
		cout << "Blue: " << static_cast<int>(m_blue) << endl;
		cout << "Alpha: " << static_cast<int>(m_alpha) << endl;
	}
};

int main()
{
	RGBA teal(0, 127, 127);
	teal.print();
	return 0;
}