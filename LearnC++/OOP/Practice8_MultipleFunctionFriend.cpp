#include "pch.h"
#include <iostream>

using namespace std;

class Humidity; // It needs to be able to compile

class Temperature
{
	int m_temp;
public:
	Temperature(int temp = 0)
		: m_temp(temp)
	{

	}

	friend void printWeather(const Temperature &temperature, const Humidity &humidity);
};

class Humidity
{
	int m_hum;
public:
	Humidity(int hum = 0)
		: m_hum(hum)
	{

	}
	friend void printWeather(const Temperature &temperature, const Humidity &humidity);
};

void printWeather(const Temperature &temperature, const Humidity &humidity)
{
	cout << "Temperature: " << temperature.m_temp << " Celcius degree \n";
	cout << "Humidity: " << humidity.m_hum << " % \n";
}

int main()
{
	Temperature temp(20);
	Humidity hum(80);
	printWeather(temp, hum);
	return 0;
}

