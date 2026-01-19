
view :: (e : b2.SensorEvents) -> (beginEvents: [] b2.SensorBeginTouchEvent, endEvents: [] b2.SensorEndTouchEvent)
{
	beginEvents: [] b2.SensorBeginTouchEvent;
	endEvents: [] b2.SensorEndTouchEvent;

	beginEvents.data = e.beginEvents;
	beginEvents.count = e.beginCount;

	endEvents.data = e.endEvents;
	endEvents.count = e.endCount;

	return beginEvents, endEvents;
}

view :: (e : b2.ContactEvents) -> (beginEvents: [] b2.ContactBeginTouchEvent, endEvents: [] b2.ContactEndTouchEvent, hitEvents: [] b2.ContactHitEvent)
{
	beginEvents: [] b2.ContactBeginTouchEvent;
	endEvents: [] b2.ContactEndTouchEvent;
	hitEvents: [] b2.ContactHitEvent;

	beginEvents.data = e.beginEvents;
	beginEvents.count = e.beginCount;

	endEvents.data = e.endEvents;
	endEvents.count = e.endCount;

	hitEvents.data = e.hitEvents;
	hitEvents.count = e.hitCount;

	return beginEvents, endEvents, hitEvents;
}

view :: (e : b2.BodyEvents) -> [] b2.BodyMoveEvent
{
	ret : [] b2.BodyMoveEvent;
	ret.data = e.moveEvents;
	ret.count = e.moveCount;
	return ret;
}

#scope_file

b2 :: #import,file "module.jai";
