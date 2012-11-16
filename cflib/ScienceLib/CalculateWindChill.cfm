function CalculateWindChill(intAirTemperature, intWindSpeed)
{

    return Round(35.74 + (0.6215 * intAirTemperature) - (35.75 * (intWindSpeed ^ 0.16)) + (0.4275 * intAirTemperature * (intWindSpeed ^ 0.16)));

}