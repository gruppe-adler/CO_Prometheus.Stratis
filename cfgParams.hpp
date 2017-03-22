class Params
{
	class TimeOfDay
	{
		title = "Time of Day";
		values[] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
		texts[] = {"00:00","01:00","02:00","03:00","04:00","05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00"};
		default = 8;
	};

	class WeatherSetting
    {
		title = "Weather";
        values[] = {-1,0,25,50,75,100};
        texts[] = {"Random","Clear","Cloudy","Overcast","Rainy","Stormy"};
        default = 0;
    };


	class Zeitbeschleunigung
	{
		title = "Time Acceleration";
		values[] = {1,2,4};
		texts[] = {"normal","2h in 1h","4h in 1h"};
		default = 1;
	};

	//THESE WERE NOT IN USE
	/*class EnableReplay
	{
		title = "enable replay";
		values[] = {false, true};
		texts[] = {"no", "yes"};
		default = false;
		isGlobal = 0;
	};*/

	/*class IsStreamable
	{
		title = "enable live stream (needs 'enable replay')";
		values[] = {false, true};
		texts[] = {"no","yes"};
		default = 0;
		isGlobal = 0;
	};*/

	/*class Debug_Mode
	{
		title = "Enable Debug Log";
		values[] = {0, 1};
		texts[] = {"no","yes"};
		default = 0;
	};*/

	class HC_enabled
	{
		title = "Enable HC";
		values[] = {0, 1};
		texts[] = {"no","yes"};
		default = 0;
	};
};
