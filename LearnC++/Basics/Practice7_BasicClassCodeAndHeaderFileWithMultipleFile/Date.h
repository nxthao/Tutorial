class Date
{
	int m_year;
	int m_month;
	int m_day;
public:

	Date(int year = 2019, int month = 10, int day = 14);

	void setDate(int year, int month, int day);

	int getYear();

	int getMonth();

	int getDay();
};