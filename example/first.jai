
floor : b2.BodyId;
ball : b2.BodyId;

main :: ()
{
	using box2d_version := b2.GetVersion();
	print("box2d version: %.%-%\n", major, minor, revision);

	// example of a library procedure:
	print("default world def: %\n", b2.DefaultWorldDef());

	// example of a procedure marked "inline" (its not inlined in this library)
	print("bwMinInt(3,5): %\n", b2.MinInt(3, 5));

	world_def := b2.DefaultWorldDef();
	world := b2.CreateWorld(*world_def);
	setup_world(world);

	print("ball pos: %\n", b2.Body_GetPosition(ball));
	print("floor pos: %\n", b2.Body_GetPosition(floor));

	simulate(world, 50);
}

setup_world :: (world: b2.WorldId)
{
	print("continuous enabled: %\n", b2.World_IsContinuousEnabled(world));

	ball_def := b2.DefaultBodyDef();
	ball_def.type = .dynamicBody;
	ball_def.position = .{0, 20};
	ball_def.name = "ball";
	ball = b2.CreateBody(world, *ball_def);

	ball_circle := b2.Circle.{ center = .{0, 0}, radius = 1 };
	ball_shape_def := b2.DefaultShapeDef();
	ball_shape_def.material.restitution = 0.3;
	ball_shape := b2.CreateCircleShape(ball, *ball_shape_def, *ball_circle);

	b2.Shape_EnableContactEvents(ball_shape, true);
	b2.Shape_EnableHitEvents(ball_shape, true);

	floor_def := b2.DefaultBodyDef();
	floor_def.type = .staticBody;
	floor_def.position = .{0, 0};
	floor_def.name = "floor";
	floor = b2.CreateBody(world, *floor_def);

	floor_capsule := b2.Capsule.{
		center1 = .{ -10, 0 },
		center2 = .{  10, 0 },
		radius = 1,
	};

	floor_shape_def := b2.DefaultShapeDef();
	floor_shape := b2.CreateCapsuleShape(floor, *floor_shape_def, *floor_capsule);
}

simulate :: (world: b2.WorldId, steps: u32)
{
	for 0..steps-1
	{
		print("step: %\n", it);
		b2.World_Step(world, timeStep = 0.1, subStepCount = 1);

		move_events := view(b2.World_GetBodyEvents(world));
		for move_events
		{
			using it;
			name := b2.Body_GetName(bodyId);

			print("move event for: %; asleep: %, xform: %\n", to_string(name), fellAsleep, transform);
		}

		begin_events, end_events, hit_events := view(b2.World_GetContactEvents(world));
		for begin_events
		{
			using it;

			nameA := to_string(b2.Body_GetName(b2.Shape_GetBody(shapeIdA)));
			nameB := to_string(b2.Body_GetName(b2.Shape_GetBody(shapeIdB)));

			print("begin contact % with %\n", nameA, nameB);
		}
		for end_events
		{
			using it;

			nameA := to_string(b2.Body_GetName(b2.Shape_GetBody(shapeIdA)));
			nameB := to_string(b2.Body_GetName(b2.Shape_GetBody(shapeIdB)));

			print("end contact % with %\n", nameA, nameB);
		}
		for hit_events
		{
			using it;
			
			nameA := to_string(b2.Body_GetName(b2.Shape_GetBody(shapeIdA)));
			nameB := to_string(b2.Body_GetName(b2.Shape_GetBody(shapeIdB)));

			print("hit event: % with % at speed %m/s\n", nameA, nameB, approachSpeed);
		}
	}
}

#import "Basic";
b2 :: #import,file "../module.jai";
using b2.util;
