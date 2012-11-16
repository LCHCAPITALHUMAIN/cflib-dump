function WeightWatchersPoints(calories,fat,fiber) {
  if (fiber gte 4)
    fiber = 4;
  return Int((calories - (fiber * 10) ) / 50 + fat / 12 + 0.5);
}