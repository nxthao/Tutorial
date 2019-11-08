#include "pch.h"
#include <iostream>
#include <cstdint>
/*
operator static_cast type need to be member function and
have to conduct in constructor
*/

using namespace std;

class FixedPoint2
{
    std::int_least16_t m_base;
    std::int_least8_t m_decimal;
public:
    FixedPoint2(std::int_least16_t base, std::int_least8_t decimal)
        : m_base(base), m_decimal(decimal)
    {
    	/*
	    This code is for printing with "." (function operator<<)
    	
        if (m_base < 0 && m_decimal < 0)
        {
            m_decimal = -m_decimal;
        }
        else if(decimal < 0)
        {
            m_base = -m_base;
            m_decimal = -m_decimal;
        }
        */

        /*
        This code is for function FixedPoint2::double. we will move it to
        negative if one of them is negative
        */
        if (base < 0 && decimal > 0)
        {
        	m_decimal = -decimal;
        }
        else if (base > 0 && decimal < 0)
        {
        	m_base = -base;
        }

    }

    operator double() const
    {
 		return m_base + static_cast<double>(m_decimal) / 100;
	}
    friend std::ostream& operator<<(std::ostream &out, const FixedPoint2 &point);
};

// operator FixedPoint2::double() const
// {
//  return m_base + static_cast<double>(m_decimal) / 100;
// }

std::ostream& operator<<(std::ostream &out, const FixedPoint2 &point)
{
    // out <<  point.m_base << "." << point.m_decimal;
    out << static_cast<double>(point);
    return out;
}


int main()
{
    FixedPoint2 a(23, 57);
    cout << a << endl;

    FixedPoint2 b(-5, 70);
    cout << b << endl;

    FixedPoint2 c(-8, -90);
    cout << c << endl;

    FixedPoint2 d(1, -04);
    cout << d << endl;
    return 0;
}