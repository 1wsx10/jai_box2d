
view :: (e : SensorEvents) -> (beginEvents: [] SensorBeginTouchEvent, endEvents: [] SensorEndTouchEvent)
{
	beginEvents: [] SensorBeginTouchEvent;
	endEvents: [] SensorEndTouchEvent;

	beginEvents.data = e.beginEvents;
	beginEvents.count = e.beginCount;

	endEvents.data = e.endEvents;
	endEvents.count = e.endCount;

	return beginEvents, endEvents;
}

view :: (e : ContactEvents) -> (beginEvents: [] ContactBeginTouchEvent, endEvents: [] ContactEndTouchEvent, hitEvents: [] ContactHitEvent)
{
	beginEvents: [] ContactBeginTouchEvent;
	endEvents: [] ContactEndTouchEvent;
	hitEvents: [] ContactHitEvent;

	beginEvents.data = e.beginEvents;
	beginEvents.count = e.beginCount;

	endEvents.data = e.endEvents;
	endEvents.count = e.endCount;

	hitEvents.data = e.hitEvents;
	hitEvents.count = e.hitCount;

	return beginEvents, endEvents, hitEvents;
}

view :: (e : BodyEvents) -> [] BodyMoveEvent
{
	ret : [] BodyMoveEvent;
	ret.data = e.moveEvents;
	ret.count = e.moveCount;
	return ret;
}

