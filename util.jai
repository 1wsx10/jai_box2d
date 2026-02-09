
is_null :: (id: $T) -> bool { return id.index1 == 0; }

as_b2vec2 :: (in: Vector2) -> Vec2
{
	#assert(size_of(Vector2) == size_of(Vec2));
	return (*in).(*Vec2).*;
}

as_b2vec2 :: (in: [] Vector2) -> [] Vec2
{
	#assert(size_of(Vector2) == size_of(Vec2));
	ret : [] Vec2 =
	.{
		data = xx in.data,
		count = in.count,
	};
	return ret;
}

as_vector2 :: (in: Vec2) -> Vector2
{
	#assert(size_of(Vector2) == size_of(Vec2));
	return (*in).(*Vector2).*;
}

as_vector2 :: (in: [] Vec2) -> [] Vector2
{
	#assert(size_of(Vector2) == size_of(Vec2));
	ret : [] Vector2 =
	.{
		data = xx in.data,
		count = in.count,
	};
	return ret;
}

as_matrix :: (in: Transform) -> Matrix3
{
	// TODO: premultiply these matrices
	translate := Matrix3.{
		1, 0, in.p.x,
		0, 1, in.p.y,
		0, 0, 1,
	};
	rotate := Matrix3.{
		in.q.c, -in.q.s, 0,
		in.q.s,  in.q.c, 0,
		0, 0, 1,
	};
	return translate * rotate;
}

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

#import "Math";
