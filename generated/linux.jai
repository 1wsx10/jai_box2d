//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



B2_HASH_INIT :: 5381;

B2_PI :: 3.14159265359;

B2_MAX_POLYGON_VERTICES :: 8;

B2_DEFAULT_CATEGORY_BITS :: 1;

/// Prototype for user allocation function
/// @param size the allocation size in bytes
/// @param alignment the required alignment, guaranteed to be a power of 2
AllocFcn :: #type (size: u32, alignment: s32) -> *void #c_call;

/// Prototype for user free function
/// @param mem the memory previously allocated through `b2AllocFcn`
FreeFcn :: #type (mem: *void) -> void #c_call;

/// Prototype for the user assert callback. Return 0 to skip the debugger break.
AssertFcn :: #type (condition: *u8, fileName: *u8, lineNumber: s32) -> s32 #c_call;

/// This allows the user to override the allocation functions. These should be
/// set during application startup.
SetAllocator :: (allocFcn: AllocFcn, freeFcn: FreeFcn) -> void #foreign box2d "b2SetAllocator";

/// @return the total bytes allocated by Box2D
GetByteCount :: () -> s32 #foreign box2d "b2GetByteCount";

/// Override the default assert callback
/// @param assertFcn a non-null assert callback
SetAssertFcn :: (assertFcn: AssertFcn) -> void #foreign box2d "b2SetAssertFcn";

/// Version numbering scheme.
/// See https://semver.org/
Version :: struct {
    /// Significant changes
    major:    s32;

    /// Incremental changes
    minor:    s32;

    /// Bug fixes
    revision: s32;
}

/// Get the current version of Box2D
GetVersion :: () -> Version #foreign box2d "b2GetVersion";

InternalAssertFcn :: (condition: *u8, fileName: *u8, lineNumber: s32) -> s32 #foreign box2d "b2InternalAssertFcn";

/// Get the absolute number of system ticks. The value is platform specific.
GetTicks :: () -> u64 #foreign box2d "b2GetTicks";

/// Get the milliseconds passed from an initial tick value.
GetMilliseconds :: (ticks: u64) -> float #foreign box2d "b2GetMilliseconds";

/// Get the milliseconds passed from an initial tick value. Resets the passed in
/// value to the current tick value.
GetMillisecondsAndReset :: (ticks: *u64) -> float #foreign box2d "b2GetMillisecondsAndReset";

/// Yield to be used in a busy loop.
Yield :: () -> void #foreign box2d "b2Yield";

Hash :: (hash: u32, data: *u8, count: s32) -> u32 #foreign box2d "b2Hash";

/// 2D vector
/// This can be used to represent a point or free vector
Vec2 :: struct {
    /// coordinates
    x: float;
    /// coordinates
    y: float;
}

/// Cosine and sine pair
/// This uses a custom implementation designed for cross-platform determinism
CosSin :: struct {
    /// cosine and sine
    cosine: float;
    sine:   float;
}

/// 2D rotation
/// This is similar to using a complex number for rotation
Rot :: struct {
    /// cosine and sine
    c: float;
    /// cosine and sine
    s: float;
}

/// A 2D rigid transform
Transform :: struct {
    p: Vec2;
    q: Rot;
}

/// A 2-by-2 Matrix
Mat22 :: struct {
    /// columns
    cx: Vec2;
    /// columns
    cy: Vec2;
}

/// Axis-aligned bounding box
AABB :: struct {
    lowerBound: Vec2;
    upperBound: Vec2;
}

/// separation = dot(normal, point) - offset
Plane :: struct {
    normal: Vec2;
    offset: float;
}

/// Is this a valid number? Not NaN or infinity.
IsValidFloat :: (a: float) -> bool #foreign box2d "b2IsValidFloat";

/// Is this a valid vector? Not NaN or infinity.
IsValidVec2 :: (v: Vec2) -> bool #foreign box2d "b2IsValidVec2";

/// Is this a valid rotation? Not NaN or infinity. Is normalized.
IsValidRotation :: (q: Rot) -> bool #foreign box2d "b2IsValidRotation";

/// Is this a valid bounding box? Not Nan or infinity. Upper bound greater than or equal to lower bound.
IsValidAABB :: (aabb: AABB) -> bool #foreign box2d "b2IsValidAABB";

/// Is this a valid plane? Normal is a unit vector. Not Nan or infinity.
IsValidPlane :: (a: Plane) -> bool #foreign box2d "b2IsValidPlane";

/// @return the minimum of two integers
MinInt :: (a: s32, b: s32) -> s32 #foreign box2d "b2MinInt";

/// @return the maximum of two integers
MaxInt :: (a: s32, b: s32) -> s32 #foreign box2d "b2MaxInt";

/// @return the absolute value of an integer
AbsInt :: (a: s32) -> s32 #foreign box2d "b2AbsInt";

/// @return an integer clamped between a lower and upper bound
ClampInt :: (a: s32, lower: s32, upper: s32) -> s32 #foreign box2d "b2ClampInt";

/// @return the minimum of two floats
MinFloat :: (a: float, b: float) -> float #foreign box2d "b2MinFloat";

/// @return the maximum of two floats
MaxFloat :: (a: float, b: float) -> float #foreign box2d "b2MaxFloat";

/// @return the absolute value of a float
AbsFloat :: (a: float) -> float #foreign box2d "b2AbsFloat";

/// @return a float clamped between a lower and upper bound
ClampFloat :: (a: float, lower: float, upper: float) -> float #foreign box2d "b2ClampFloat";

/// Compute an approximate arctangent in the range [-pi, pi]
/// This is hand coded for cross-platform determinism. The atan2f
/// function in the standard library is not cross-platform deterministic.
///	Accurate to around 0.0023 degrees
Atan2 :: (y: float, x: float) -> float #foreign box2d "b2Atan2";

/// Compute the cosine and sine of an angle in radians. Implemented
/// for cross-platform determinism.
ComputeCosSin :: (radians: float) -> CosSin #foreign box2d "b2ComputeCosSin";

/// Vector dot product
Dot :: (a: Vec2, b: Vec2) -> float #foreign box2d "b2Dot";

/// Vector cross product. In 2D this yields a scalar.
Cross :: (a: Vec2, b: Vec2) -> float #foreign box2d "b2Cross";

/// Perform the cross product on a vector and a scalar. In 2D this produces a vector.
CrossVS :: (v: Vec2, s: float) -> Vec2 #foreign box2d "b2CrossVS";

/// Perform the cross product on a scalar and a vector. In 2D this produces a vector.
CrossSV :: (s: float, v: Vec2) -> Vec2 #foreign box2d "b2CrossSV";

/// Get a left pointing perpendicular vector. Equivalent to b2CrossSV(1.0f, v)
LeftPerp :: (v: Vec2) -> Vec2 #foreign box2d "b2LeftPerp";

/// Get a right pointing perpendicular vector. Equivalent to b2CrossVS(v, 1.0f)
RightPerp :: (v: Vec2) -> Vec2 #foreign box2d "b2RightPerp";

/// Vector addition
Add :: (a: Vec2, b: Vec2) -> Vec2 #foreign box2d "b2Add";

/// Vector subtraction
Sub :: (a: Vec2, b: Vec2) -> Vec2 #foreign box2d "b2Sub";

/// Vector negation
Neg :: (a: Vec2) -> Vec2 #foreign box2d "b2Neg";

/// Vector linear interpolation
/// https://fgiesen.wordpress.com/2012/08/15/linear-interpolation-past-present-and-future/
Lerp :: (a: Vec2, b: Vec2, t: float) -> Vec2 #foreign box2d "b2Lerp";

/// Component-wise multiplication
Mul :: (a: Vec2, b: Vec2) -> Vec2 #foreign box2d "b2Mul";

/// Multiply a scalar and vector
MulSV :: (s: float, v: Vec2) -> Vec2 #foreign box2d "b2MulSV";

/// a + s * b
MulAdd :: (a: Vec2, s: float, b: Vec2) -> Vec2 #foreign box2d "b2MulAdd";

/// a - s * b
MulSub :: (a: Vec2, s: float, b: Vec2) -> Vec2 #foreign box2d "b2MulSub";

/// Component-wise absolute vector
Abs :: (a: Vec2) -> Vec2 #foreign box2d "b2Abs";

/// Component-wise minimum vector
Min :: (a: Vec2, b: Vec2) -> Vec2 #foreign box2d "b2Min";

/// Component-wise maximum vector
Max :: (a: Vec2, b: Vec2) -> Vec2 #foreign box2d "b2Max";

/// Component-wise clamp vector v into the range [a, b]
Clamp :: (v: Vec2, a: Vec2, b: Vec2) -> Vec2 #foreign box2d "b2Clamp";

/// Get the length of this vector (the norm)
Length :: (v: Vec2) -> float #foreign box2d "b2Length";

/// Get the distance between two points
Distance :: (a: Vec2, b: Vec2) -> float #foreign box2d "b2Distance";

/// Convert a vector into a unit vector if possible, otherwise returns the zero vector.
/// todo MSVC is not inlining this function in several places per warning 4710
Normalize :: (v: Vec2) -> Vec2 #foreign box2d "b2Normalize";

/// Determines if the provided vector is normalized (norm(a) == 1).
IsNormalized :: (a: Vec2) -> bool #foreign box2d "b2IsNormalized";

/// Convert a vector into a unit vector if possible, otherwise returns the zero vector. Also
/// outputs the length.
GetLengthAndNormalize :: (length: *float, v: Vec2) -> Vec2 #foreign box2d "b2GetLengthAndNormalize";

/// Normalize rotation
NormalizeRot :: (q: Rot) -> Rot #foreign box2d "b2NormalizeRot";

/// Integrate rotation from angular velocity
/// @param q1 initial rotation
/// @param deltaAngle the angular displacement in radians
IntegrateRotation :: (q1: Rot, deltaAngle: float) -> Rot #foreign box2d "b2IntegrateRotation";

/// Get the length squared of this vector
LengthSquared :: (v: Vec2) -> float #foreign box2d "b2LengthSquared";

/// Get the distance squared between points
DistanceSquared :: (a: Vec2, b: Vec2) -> float #foreign box2d "b2DistanceSquared";

/// Make a rotation using an angle in radians
MakeRot :: (radians: float) -> Rot #foreign box2d "b2MakeRot";

/// Compute the rotation between two unit vectors
ComputeRotationBetweenUnitVectors :: (v1: Vec2, v2: Vec2) -> Rot #foreign box2d "b2ComputeRotationBetweenUnitVectors";

/// Is this rotation normalized?
IsNormalizedRot :: (q: Rot) -> bool #foreign box2d "b2IsNormalizedRot";

/// Normalized linear interpolation
/// https://fgiesen.wordpress.com/2012/08/15/linear-interpolation-past-present-and-future/
///	https://web.archive.org/web/20170825184056/http://number-none.com/product/Understanding%20Slerp,%20Then%20Not%20Using%20It/
NLerp :: (q1: Rot, q2: Rot, t: float) -> Rot #foreign box2d "b2NLerp";

/// Compute the angular velocity necessary to rotate between two rotations over a give time
/// @param q1 initial rotation
/// @param q2 final rotation
/// @param inv_h inverse time step
ComputeAngularVelocity :: (q1: Rot, q2: Rot, inv_h: float) -> float #foreign box2d "b2ComputeAngularVelocity";

/// Get the angle in radians in the range [-pi, pi]
Rot_GetAngle :: (q: Rot) -> float #foreign box2d "b2Rot_GetAngle";

/// Get the x-axis
Rot_GetXAxis :: (q: Rot) -> Vec2 #foreign box2d "b2Rot_GetXAxis";

/// Get the y-axis
Rot_GetYAxis :: (q: Rot) -> Vec2 #foreign box2d "b2Rot_GetYAxis";

/// Multiply two rotations: q * r
MulRot :: (q: Rot, r: Rot) -> Rot #foreign box2d "b2MulRot";

/// Transpose multiply two rotations: qT * r
InvMulRot :: (q: Rot, r: Rot) -> Rot #foreign box2d "b2InvMulRot";

/// relative angle between b and a (rot_b * inv(rot_a))
RelativeAngle :: (b: Rot, a: Rot) -> float #foreign box2d "b2RelativeAngle";

/// Convert any angle into the range [-pi, pi]
UnwindAngle :: (radians: float) -> float #foreign box2d "b2UnwindAngle";

/// Rotate a vector
RotateVector :: (q: Rot, v: Vec2) -> Vec2 #foreign box2d "b2RotateVector";

/// Inverse rotate a vector
InvRotateVector :: (q: Rot, v: Vec2) -> Vec2 #foreign box2d "b2InvRotateVector";

/// Transform a point (e.g. local space to world space)
TransformPoint :: (t: Transform, p: Vec2) -> Vec2 #foreign box2d "b2TransformPoint";

/// Inverse transform a point (e.g. world space to local space)
InvTransformPoint :: (t: Transform, p: Vec2) -> Vec2 #foreign box2d "b2InvTransformPoint";

/// Multiply two transforms. If the result is applied to a point p local to frame B,
/// the transform would first convert p to a point local to frame A, then into a point
/// in the world frame.
/// v2 = A.q.Rot(B.q.Rot(v1) + B.p) + A.p
///    = (A.q * B.q).Rot(v1) + A.q.Rot(B.p) + A.p
MulTransforms :: (A: Transform, B: Transform) -> Transform #foreign box2d "b2MulTransforms";

/// Creates a transform that converts a local point in frame B to a local point in frame A.
/// v2 = A.q' * (B.q * v1 + B.p - A.p)
///    = A.q' * B.q * v1 + A.q' * (B.p - A.p)
InvMulTransforms :: (A: Transform, B: Transform) -> Transform #foreign box2d "b2InvMulTransforms";

/// Multiply a 2-by-2 matrix times a 2D vector
MulMV :: (A: Mat22, v: Vec2) -> Vec2 #foreign box2d "b2MulMV";

/// Get the inverse of a 2-by-2 matrix
GetInverse22 :: (A: Mat22) -> Mat22 #foreign box2d "b2GetInverse22";

/// Solve A * x = b, where b is a column vector. This is more efficient
/// than computing the inverse in one-shot cases.
Solve22 :: (A: Mat22, b: Vec2) -> Vec2 #foreign box2d "b2Solve22";

/// Does a fully contain b
AABB_Contains :: (a: AABB, b: AABB) -> bool #foreign box2d "b2AABB_Contains";

/// Get the center of the AABB.
AABB_Center :: (a: AABB) -> Vec2 #foreign box2d "b2AABB_Center";

/// Get the extents of the AABB (half-widths).
AABB_Extents :: (a: AABB) -> Vec2 #foreign box2d "b2AABB_Extents";

/// Union of two AABBs
AABB_Union :: (a: AABB, b: AABB) -> AABB #foreign box2d "b2AABB_Union";

/// Do a and b overlap
AABB_Overlaps :: (a: AABB, b: AABB) -> bool #foreign box2d "b2AABB_Overlaps";

/// Compute the bounding box of an array of circles
MakeAABB :: (points: *Vec2, count: s32, radius: float) -> AABB #foreign box2d "b2MakeAABB";

/// Signed separation of a point from a plane
PlaneSeparation :: (plane: Plane, point: Vec2) -> float #foreign box2d "b2PlaneSeparation";

/// One-dimensional mass-spring-damper simulation. Returns the new velocity given the position and time step.
/// You can then compute the new position using:
/// position += timeStep * newVelocity
/// This drives towards a zero position. By using implicit integration we get a stable solution
/// that doesn't require transcendental functions.
SpringDamper :: (hertz: float, dampingRatio: float, position: float, velocity: float, timeStep: float) -> float #foreign box2d "b2SpringDamper";

/// Box2D bases all length units on meters, but you may need different units for your game.
/// You can set this value to use different units. This should be done at application startup
/// and only modified once. Default value is 1.
/// For example, if your game uses pixels for units you can use pixels for all length values
/// sent to Box2D. There should be no extra cost. However, Box2D has some internal tolerances
/// and thresholds that have been tuned for meters. By calling this function, Box2D is able
/// to adjust those tolerances and thresholds to improve accuracy.
/// A good rule of thumb is to pass the height of your player character to this function. So
/// if your player character is 32 pixels high, then pass 32 to this function. Then you may
/// confidently use pixels for all the length values sent to Box2D. All length values returned
/// from Box2D will also be pixels because Box2D does not do any scaling internally.
/// However, you are now on the hook for coming up with good values for gravity, density, and
/// forces.
/// @warning This must be modified before any calls to Box2D
SetLengthUnitsPerMeter :: (lengthUnits: float) -> void #foreign box2d "b2SetLengthUnitsPerMeter";

/// Get the current length units per meter.
GetLengthUnitsPerMeter :: () -> float #foreign box2d "b2GetLengthUnitsPerMeter";

/// Low level ray cast input data
RayCastInput :: struct {
    /// Start point of the ray cast
    origin:      Vec2;

    /// Translation of the ray cast
    translation: Vec2;

    /// The maximum fraction of the translation to consider, typically 1
    maxFraction: float;
}

/// A distance proxy is used by the GJK algorithm. It encapsulates any shape.
/// You can provide between 1 and B2_MAX_POLYGON_VERTICES and a radius.
ShapeProxy :: struct {
    /// The point cloud
    points: [8] Vec2;

    /// The number of points. Must be greater than 0.
    count:  s32;

    /// The external radius of the point cloud. May be zero.
    radius: float;
}

/// Low level shape cast input in generic form. This allows casting an arbitrary point
/// cloud wrap with a radius. For example, a circle is a single point with a non-zero radius.
/// A capsule is two points with a non-zero radius. A box is four points with a zero radius.
ShapeCastInput :: struct {
    /// A generic shape
    proxy:       ShapeProxy;

    /// The translation of the shape cast
    translation: Vec2;

    /// The maximum fraction of the translation to consider, typically 1
    maxFraction: float;

    /// Allow shape cast to encroach when initially touching. This only works if the radius is greater than zero.
    canEncroach: bool;
}

/// Low level ray cast or shape-cast output data. Returns a zero fraction and normal in the case of initial overlap.
CastOutput :: struct {
    /// The surface normal at the hit point
    normal:     Vec2;

    /// The surface hit point
    point:      Vec2;

    /// The fraction of the input translation at collision
    fraction:   float;

    /// The number of iterations used
    iterations: s32;

    /// Did the cast hit?
    hit:        bool;
}

/// This holds the mass data computed for a shape.
MassData :: struct {
    /// The mass of the shape, usually in kilograms.
    mass:              float;

    /// The position of the shape's centroid relative to the shape's origin.
    center:            Vec2;

    /// The rotational inertia of the shape about the local origin.
    rotationalInertia: float;
}

/// A solid circle
Circle :: struct {
    /// The local center
    center: Vec2;

    /// The radius
    radius: float;
}

/// A solid capsule can be viewed as two semicircles connected
/// by a rectangle.
Capsule :: struct {
    /// Local center of the first semicircle
    center1: Vec2;

    /// Local center of the second semicircle
    center2: Vec2;

    /// The radius of the semicircles
    radius:  float;
}

/// A solid convex polygon. It is assumed that the interior of the polygon is to
/// the left of each edge.
/// Polygons have a maximum number of vertices equal to B2_MAX_POLYGON_VERTICES.
/// In most cases you should not need many vertices for a convex polygon.
/// @warning DO NOT fill this out manually, instead use a helper function like
/// b2MakePolygon or b2MakeBox.
Polygon :: struct {
    /// The polygon vertices
    vertices: [8] Vec2;

    /// The outward normal vectors of the polygon sides
    normals:  [8] Vec2;

    /// The centroid of the polygon
    centroid: Vec2;

    /// The external radius for rounded polygons
    radius:   float;

    /// The number of polygon vertices
    count:    s32;
}

/// A line segment with two-sided collision.
Segment :: struct {
    /// The first point
    point1: Vec2;

    /// The second point
    point2: Vec2;
}

/// A line segment with one-sided collision. Only collides on the right side.
/// Several of these are generated for a chain shape.
/// ghost1 -> point1 -> point2 -> ghost2
ChainSegment :: struct {
    /// The tail ghost vertex
    ghost1:  Vec2;

    /// The line segment
    segment: Segment;

    /// The head ghost vertex
    ghost2:  Vec2;

    /// The owning chain shape index (internal usage only)
    chainId: s32;
}

/// Validate ray cast input data (NaN, etc)
IsValidRay :: (input: *RayCastInput) -> bool #foreign box2d "b2IsValidRay";

/// Make a convex polygon from a convex hull. This will assert if the hull is not valid.
/// @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull
MakePolygon :: (hull: *Hull, radius: float) -> Polygon #foreign box2d "b2MakePolygon";

/// Make an offset convex polygon from a convex hull. This will assert if the hull is not valid.
/// @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull
MakeOffsetPolygon :: (hull: *Hull, position: Vec2, rotation: Rot) -> Polygon #foreign box2d "b2MakeOffsetPolygon";

/// Make an offset convex polygon from a convex hull. This will assert if the hull is not valid.
/// @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull
MakeOffsetRoundedPolygon :: (hull: *Hull, position: Vec2, rotation: Rot, radius: float) -> Polygon #foreign box2d "b2MakeOffsetRoundedPolygon";

/// Make a square polygon, bypassing the need for a convex hull.
/// @param halfWidth the half-width
MakeSquare :: (halfWidth: float) -> Polygon #foreign box2d "b2MakeSquare";

/// Make a box (rectangle) polygon, bypassing the need for a convex hull.
/// @param halfWidth the half-width (x-axis)
/// @param halfHeight the half-height (y-axis)
MakeBox :: (halfWidth: float, halfHeight: float) -> Polygon #foreign box2d "b2MakeBox";

/// Make a rounded box, bypassing the need for a convex hull.
/// @param halfWidth the half-width (x-axis)
/// @param halfHeight the half-height (y-axis)
/// @param radius the radius of the rounded extension
MakeRoundedBox :: (halfWidth: float, halfHeight: float, radius: float) -> Polygon #foreign box2d "b2MakeRoundedBox";

/// Make an offset box, bypassing the need for a convex hull.
/// @param halfWidth the half-width (x-axis)
/// @param halfHeight the half-height (y-axis)
/// @param center the local center of the box
/// @param rotation the local rotation of the box
MakeOffsetBox :: (halfWidth: float, halfHeight: float, center: Vec2, rotation: Rot) -> Polygon #foreign box2d "b2MakeOffsetBox";

/// Make an offset rounded box, bypassing the need for a convex hull.
/// @param halfWidth the half-width (x-axis)
/// @param halfHeight the half-height (y-axis)
/// @param center the local center of the box
/// @param rotation the local rotation of the box
/// @param radius the radius of the rounded extension
MakeOffsetRoundedBox :: (halfWidth: float, halfHeight: float, center: Vec2, rotation: Rot, radius: float) -> Polygon #foreign box2d "b2MakeOffsetRoundedBox";

/// Transform a polygon. This is useful for transferring a shape from one body to another.
TransformPolygon :: (transform: Transform, polygon: *Polygon) -> Polygon #foreign box2d "b2TransformPolygon";

/// Compute mass properties of a circle
ComputeCircleMass :: (shape: *Circle, density: float) -> MassData #foreign box2d "b2ComputeCircleMass";

/// Compute mass properties of a capsule
ComputeCapsuleMass :: (shape: *Capsule, density: float) -> MassData #foreign box2d "b2ComputeCapsuleMass";

/// Compute mass properties of a polygon
ComputePolygonMass :: (shape: *Polygon, density: float) -> MassData #foreign box2d "b2ComputePolygonMass";

/// Compute the bounding box of a transformed circle
ComputeCircleAABB :: (shape: *Circle, transform: Transform) -> AABB #foreign box2d "b2ComputeCircleAABB";

/// Compute the bounding box of a transformed capsule
ComputeCapsuleAABB :: (shape: *Capsule, transform: Transform) -> AABB #foreign box2d "b2ComputeCapsuleAABB";

/// Compute the bounding box of a transformed polygon
ComputePolygonAABB :: (shape: *Polygon, transform: Transform) -> AABB #foreign box2d "b2ComputePolygonAABB";

/// Compute the bounding box of a transformed line segment
ComputeSegmentAABB :: (shape: *Segment, transform: Transform) -> AABB #foreign box2d "b2ComputeSegmentAABB";

/// Test a point for overlap with a circle in local space
PointInCircle :: (point: Vec2, shape: *Circle) -> bool #foreign box2d "b2PointInCircle";

/// Test a point for overlap with a capsule in local space
PointInCapsule :: (point: Vec2, shape: *Capsule) -> bool #foreign box2d "b2PointInCapsule";

/// Test a point for overlap with a convex polygon in local space
PointInPolygon :: (point: Vec2, shape: *Polygon) -> bool #foreign box2d "b2PointInPolygon";

/// Ray cast versus circle shape in local space. Initial overlap is treated as a miss.
RayCastCircle :: (input: *RayCastInput, shape: *Circle) -> CastOutput #foreign box2d "b2RayCastCircle";

/// Ray cast versus capsule shape in local space. Initial overlap is treated as a miss.
RayCastCapsule :: (input: *RayCastInput, shape: *Capsule) -> CastOutput #foreign box2d "b2RayCastCapsule";

/// Ray cast versus segment shape in local space. Optionally treat the segment as one-sided with hits from
/// the left side being treated as a miss.
RayCastSegment :: (input: *RayCastInput, shape: *Segment, oneSided: bool) -> CastOutput #foreign box2d "b2RayCastSegment";

/// Ray cast versus polygon shape in local space. Initial overlap is treated as a miss.
RayCastPolygon :: (input: *RayCastInput, shape: *Polygon) -> CastOutput #foreign box2d "b2RayCastPolygon";

/// Shape cast versus a circle. Initial overlap is treated as a miss.
ShapeCastCircle :: (input: *ShapeCastInput, shape: *Circle) -> CastOutput #foreign box2d "b2ShapeCastCircle";

/// Shape cast versus a capsule. Initial overlap is treated as a miss.
ShapeCastCapsule :: (input: *ShapeCastInput, shape: *Capsule) -> CastOutput #foreign box2d "b2ShapeCastCapsule";

/// Shape cast versus a line segment. Initial overlap is treated as a miss.
ShapeCastSegment :: (input: *ShapeCastInput, shape: *Segment) -> CastOutput #foreign box2d "b2ShapeCastSegment";

/// Shape cast versus a convex polygon. Initial overlap is treated as a miss.
ShapeCastPolygon :: (input: *ShapeCastInput, shape: *Polygon) -> CastOutput #foreign box2d "b2ShapeCastPolygon";

/// A convex hull. Used to create convex polygons.
/// @warning Do not modify these values directly, instead use b2ComputeHull()
Hull :: struct {
    /// The final points of the hull
    points: [8] Vec2;

    /// The number of points
    count:  s32;
}

/// Compute the convex hull of a set of points. Returns an empty hull if it fails.
/// Some failure cases:
/// - all points very close together
/// - all points on a line
/// - less than 3 points
/// - more than B2_MAX_POLYGON_VERTICES points
/// This welds close points and removes collinear points.
/// @warning Do not modify a hull once it has been computed
ComputeHull :: (points: *Vec2, count: s32) -> Hull #foreign box2d "b2ComputeHull";

/// This determines if a hull is valid. Checks for:
/// - convexity
/// - collinear points
/// This is expensive and should not be called at runtime.
ValidateHull :: (hull: *Hull) -> bool #foreign box2d "b2ValidateHull";

/// Result of computing the distance between two line segments
SegmentDistanceResult :: struct {
    /// The closest point on the first segment
    closest1:        Vec2;

    /// The closest point on the second segment
    closest2:        Vec2;

    /// The barycentric coordinate on the first segment
    fraction1:       float;

    /// The barycentric coordinate on the second segment
    fraction2:       float;

    /// The squared distance between the closest points
    distanceSquared: float;
}

/// Compute the distance between two line segments, clamping at the end points if needed.
SegmentDistance :: (p1: Vec2, q1: Vec2, p2: Vec2, q2: Vec2) -> SegmentDistanceResult #foreign box2d "b2SegmentDistance";

/// Used to warm start the GJK simplex. If you call this function multiple times with nearby
/// transforms this might improve performance. Otherwise you can zero initialize this.
/// The distance cache must be initialized to zero on the first call.
/// Users should generally just zero initialize this structure for each call.
SimplexCache :: struct {
    /// The number of stored simplex points
    count:  u16;

    /// The cached simplex indices on shape A
    indexA: [3] u8;

    /// The cached simplex indices on shape B
    indexB: [3] u8;
}

/// Input for b2ShapeDistance
DistanceInput :: struct {
    /// The proxy for shape A
    proxyA:     ShapeProxy;

    /// The proxy for shape B
    proxyB:     ShapeProxy;

    /// The world transform for shape A
    transformA: Transform;

    /// The world transform for shape B
    transformB: Transform;

    /// Should the proxy radius be considered?
    useRadii:   bool;
}

/// Output for b2ShapeDistance
DistanceOutput :: struct {
    pointA:       Vec2; ///< Closest point on shapeA
    pointB:       Vec2; ///< Closest point on shapeB
    normal:       Vec2; ///< Normal vector that points from A to B. Invalid if distance is zero.
    distance:     float; ///< The final distance, zero if overlapped
    iterations:   s32; ///< Number of GJK iterations used
    simplexCount: s32; ///< The number of simplexes stored in the simplex array
}

/// Simplex vertex for debugging the GJK algorithm
SimplexVertex :: struct {
    wA:     Vec2; ///< support point in proxyA
    wB:     Vec2; ///< support point in proxyB
    w:      Vec2; ///< wB - wA
    a:      float; ///< barycentric coordinate for closest point
    indexA: s32; ///< wA index
    indexB: s32; ///< wB index
}

/// Simplex from the GJK algorithm
Simplex :: struct {
    v1:    SimplexVertex; ///< vertices
    v2:    SimplexVertex; ///< vertices
    v3:    SimplexVertex; ///< vertices
    count: s32; ///< number of valid vertices
}

/// Compute the closest points between two shapes represented as point clouds.
/// b2SimplexCache cache is input/output. On the first call set b2SimplexCache.count to zero.
/// The underlying GJK algorithm may be debugged by passing in debug simplexes and capacity. You may pass in NULL and 0 for these.
ShapeDistance :: (input: *DistanceInput, cache: *SimplexCache, simplexes: *Simplex, simplexCapacity: s32) -> DistanceOutput #foreign box2d "b2ShapeDistance";

/// Input parameters for b2ShapeCast
ShapeCastPairInput :: struct {
    proxyA:       ShapeProxy; ///< The proxy for shape A
    proxyB:       ShapeProxy; ///< The proxy for shape B
    transformA:   Transform; ///< The world transform for shape A
    transformB:   Transform; ///< The world transform for shape B
    translationB: Vec2; ///< The translation of shape B
    maxFraction:  float; ///< The fraction of the translation to consider, typically 1
    canEncroach:  bool; ///< Allows shapes with a radius to move slightly closer if already touching
}

/// Perform a linear shape cast of shape B moving and shape A fixed. Determines the hit point, normal, and translation fraction.
/// Initially touching shapes are treated as a miss.
ShapeCast :: (input: *ShapeCastPairInput) -> CastOutput #foreign box2d "b2ShapeCast";

/// Make a proxy for use in overlap, shape cast, and related functions. This is a deep copy of the points.
MakeProxy :: (points: *Vec2, count: s32, radius: float) -> ShapeProxy #foreign box2d "b2MakeProxy";

/// Make a proxy with a transform. This is a deep copy of the points.
MakeOffsetProxy :: (points: *Vec2, count: s32, radius: float, position: Vec2, rotation: Rot) -> ShapeProxy #foreign box2d "b2MakeOffsetProxy";

/// This describes the motion of a body/shape for TOI computation. Shapes are defined with respect to the body origin,
/// which may not coincide with the center of mass. However, to support dynamics we must interpolate the center of mass
/// position.
Sweep :: struct {
    localCenter: Vec2; ///< Local center of mass position
    c1:          Vec2; ///< Starting center of mass world position
    c2:          Vec2; ///< Ending center of mass world position
    q1:          Rot; ///< Starting world rotation
    q2:          Rot; ///< Ending world rotation
}

/// Evaluate the transform sweep at a specific time.
GetSweepTransform :: (sweep: *Sweep, time: float) -> Transform #foreign box2d "b2GetSweepTransform";

/// Input parameters for b2TimeOfImpact
TOIInput :: struct {
    proxyA:      ShapeProxy; ///< The proxy for shape A
    proxyB:      ShapeProxy; ///< The proxy for shape B
    sweepA:      Sweep; ///< The movement of shape A
    sweepB:      Sweep; ///< The movement of shape B
    maxFraction: float; ///< Defines the sweep interval [0, maxFraction]
}

/// Describes the TOI output
TOIState :: enum u32 {
    Unknown    :: 0;
    Failed     :: 1;
    Overlapped :: 2;
    Hit        :: 3;
    Separated  :: 4;

    b2_toiStateUnknown    :: Unknown;
    b2_toiStateFailed     :: Failed;
    b2_toiStateOverlapped :: Overlapped;
    b2_toiStateHit        :: Hit;
    b2_toiStateSeparated  :: Separated;
}

/// Output parameters for b2TimeOfImpact.
TOIOutput :: struct {
    state:    TOIState; ///< The type of result
    fraction: float; ///< The sweep time of the collision
}

/// Compute the upper bound on time before two shapes penetrate. Time is represented as
/// a fraction between [0,tMax]. This uses a swept separating axis and may miss some intermediate,
/// non-tunneling collisions. If you change the time interval, you should call this function
/// again.
TimeOfImpact :: (input: *TOIInput) -> TOIOutput #foreign box2d "b2TimeOfImpact";

/// A manifold point is a contact point belonging to a contact manifold.
/// It holds details related to the geometry and dynamics of the contact points.
/// Box2D uses speculative collision so some contact points may be separated.
/// You may use the totalNormalImpulse to determine if there was an interaction during
/// the time step.
ManifoldPoint :: struct {
    /// Location of the contact point in world space. Subject to precision loss at large coordinates.
    /// @note Should only be used for debugging.
    point:              Vec2;

    /// Location of the contact point relative to shapeA's origin in world space
    /// @note When used internally to the Box2D solver, this is relative to the body center of mass.
    anchorA:            Vec2;

    /// Location of the contact point relative to shapeB's origin in world space
    /// @note When used internally to the Box2D solver, this is relative to the body center of mass.
    anchorB:            Vec2;

    /// The separation of the contact point, negative if penetrating
    separation:         float;

    /// The impulse along the manifold normal vector.
    normalImpulse:      float;

    /// The friction impulse
    tangentImpulse:     float;

    /// The total normal impulse applied across sub-stepping and restitution. This is important
    /// to identify speculative contact points that had an interaction in the time step.
    totalNormalImpulse: float;

    /// Relative normal velocity pre-solve. Used for hit events. If the normal impulse is
    /// zero then there was no hit. Negative means shapes are approaching.
    normalVelocity:     float;

    /// Uniquely identifies a contact point between two shapes
    id:                 u16;

    /// Did this contact point exist the previous step?
    persisted:          bool;
}

/// A contact manifold describes the contact points between colliding shapes.
/// @note Box2D uses speculative collision so some contact points may be separated.
Manifold :: struct {
    /// The unit normal vector in world space, points from shape A to bodyB
    normal:         Vec2;

    /// Angular impulse applied for rolling resistance. N * m * s = kg * m^2 / s
    rollingImpulse: float;

    /// The manifold points, up to two are possible in 2D
    points:         [2] ManifoldPoint;

    /// The number of contacts points, will be 0, 1, or 2
    pointCount:     s32;
}

/// Compute the contact manifold between two circles
CollideCircles :: (circleA: *Circle, xfA: Transform, circleB: *Circle, xfB: Transform) -> Manifold #foreign box2d "b2CollideCircles";

/// Compute the contact manifold between a capsule and circle
CollideCapsuleAndCircle :: (capsuleA: *Capsule, xfA: Transform, circleB: *Circle, xfB: Transform) -> Manifold #foreign box2d "b2CollideCapsuleAndCircle";

/// Compute the contact manifold between an segment and a circle
CollideSegmentAndCircle :: (segmentA: *Segment, xfA: Transform, circleB: *Circle, xfB: Transform) -> Manifold #foreign box2d "b2CollideSegmentAndCircle";

/// Compute the contact manifold between a polygon and a circle
CollidePolygonAndCircle :: (polygonA: *Polygon, xfA: Transform, circleB: *Circle, xfB: Transform) -> Manifold #foreign box2d "b2CollidePolygonAndCircle";

/// Compute the contact manifold between a capsule and circle
CollideCapsules :: (capsuleA: *Capsule, xfA: Transform, capsuleB: *Capsule, xfB: Transform) -> Manifold #foreign box2d "b2CollideCapsules";

/// Compute the contact manifold between an segment and a capsule
CollideSegmentAndCapsule :: (segmentA: *Segment, xfA: Transform, capsuleB: *Capsule, xfB: Transform) -> Manifold #foreign box2d "b2CollideSegmentAndCapsule";

/// Compute the contact manifold between a polygon and capsule
CollidePolygonAndCapsule :: (polygonA: *Polygon, xfA: Transform, capsuleB: *Capsule, xfB: Transform) -> Manifold #foreign box2d "b2CollidePolygonAndCapsule";

/// Compute the contact manifold between two polygons
CollidePolygons :: (polygonA: *Polygon, xfA: Transform, polygonB: *Polygon, xfB: Transform) -> Manifold #foreign box2d "b2CollidePolygons";

/// Compute the contact manifold between an segment and a polygon
CollideSegmentAndPolygon :: (segmentA: *Segment, xfA: Transform, polygonB: *Polygon, xfB: Transform) -> Manifold #foreign box2d "b2CollideSegmentAndPolygon";

/// Compute the contact manifold between a chain segment and a circle
CollideChainSegmentAndCircle :: (segmentA: *ChainSegment, xfA: Transform, circleB: *Circle, xfB: Transform) -> Manifold #foreign box2d "b2CollideChainSegmentAndCircle";

/// Compute the contact manifold between a chain segment and a capsule
CollideChainSegmentAndCapsule :: (segmentA: *ChainSegment, xfA: Transform, capsuleB: *Capsule, xfB: Transform, cache: *SimplexCache) -> Manifold #foreign box2d "b2CollideChainSegmentAndCapsule";

/// Compute the contact manifold between a chain segment and a rounded polygon
CollideChainSegmentAndPolygon :: (segmentA: *ChainSegment, xfA: Transform, polygonB: *Polygon, xfB: Transform, cache: *SimplexCache) -> Manifold #foreign box2d "b2CollideChainSegmentAndPolygon";

/// The dynamic tree structure. This should be considered private data.
/// It is placed here for performance reasons.
DynamicTree :: struct {
    TreeNode :: struct {}
    /// The tree nodes
    nodes:           *TreeNode;

    /// The root index
    root:            s32;

    /// The number of nodes
    nodeCount:       s32;

    /// The allocated node space
    nodeCapacity:    s32;

    /// Node free list
    freeList:        s32;

    /// Number of proxies created
    proxyCount:      s32;

    /// Leaf indices for rebuild
    leafIndices:     *s32;

    /// Leaf bounding boxes for rebuild
    leafBoxes:       *AABB;

    /// Leaf bounding box centers for rebuild
    leafCenters:     *Vec2;

    /// Bins for sorting during rebuild
    binIndices:      *s32;

    /// Allocated space for rebuilding
    rebuildCapacity: s32;
}

/// These are performance results returned by dynamic tree queries.
TreeStats :: struct {
    /// Number of internal nodes visited during the query
    nodeVisits: s32;

    /// Number of leaf nodes visited during the query
    leafVisits: s32;
}

/// Constructing the tree initializes the node pool.
DynamicTree_Create :: () -> DynamicTree #foreign box2d "b2DynamicTree_Create";

/// Destroy the tree, freeing the node pool.
DynamicTree_Destroy :: (tree: *DynamicTree) -> void #foreign box2d "b2DynamicTree_Destroy";

/// Create a proxy. Provide an AABB and a userData value.
DynamicTree_CreateProxy :: (tree: *DynamicTree, aabb: AABB, categoryBits: u64, userData: u64) -> s32 #foreign box2d "b2DynamicTree_CreateProxy";

/// Destroy a proxy. This asserts if the id is invalid.
DynamicTree_DestroyProxy :: (tree: *DynamicTree, proxyId: s32) -> void #foreign box2d "b2DynamicTree_DestroyProxy";

/// Move a proxy to a new AABB by removing and reinserting into the tree.
DynamicTree_MoveProxy :: (tree: *DynamicTree, proxyId: s32, aabb: AABB) -> void #foreign box2d "b2DynamicTree_MoveProxy";

/// Enlarge a proxy and enlarge ancestors as necessary.
DynamicTree_EnlargeProxy :: (tree: *DynamicTree, proxyId: s32, aabb: AABB) -> void #foreign box2d "b2DynamicTree_EnlargeProxy";

/// Modify the category bits on a proxy. This is an expensive operation.
DynamicTree_SetCategoryBits :: (tree: *DynamicTree, proxyId: s32, categoryBits: u64) -> void #foreign box2d "b2DynamicTree_SetCategoryBits";

/// Get the category bits on a proxy.
DynamicTree_GetCategoryBits :: (tree: *DynamicTree, proxyId: s32) -> u64 #foreign box2d "b2DynamicTree_GetCategoryBits";

/// This function receives proxies found in the AABB query.
/// @return true if the query should continue
TreeQueryCallbackFcn :: #type (proxyId: s32, userData: u64, _context: *void) -> bool #c_call;

/// Query an AABB for overlapping proxies. The callback class is called for each proxy that overlaps the supplied AABB.
///	@return performance data
DynamicTree_Query :: (tree: *DynamicTree, aabb: AABB, maskBits: u64, callback: TreeQueryCallbackFcn, _context: *void) -> TreeStats #foreign box2d "b2DynamicTree_Query";

/// This function receives clipped ray cast input for a proxy. The function
/// returns the new ray fraction.
/// - return a value of 0 to terminate the ray cast
/// - return a value less than input->maxFraction to clip the ray
/// - return a value of input->maxFraction to continue the ray cast without clipping
TreeRayCastCallbackFcn :: #type (input: *RayCastInput, proxyId: s32, userData: u64, _context: *void) -> float #c_call;

/// Ray cast against the proxies in the tree. This relies on the callback
/// to perform a exact ray cast in the case were the proxy contains a shape.
/// The callback also performs the any collision filtering. This has performance
/// roughly equal to k * log(n), where k is the number of collisions and n is the
/// number of proxies in the tree.
/// Bit-wise filtering using mask bits can greatly improve performance in some scenarios.
///	However, this filtering may be approximate, so the user should still apply filtering to results.
/// @param tree the dynamic tree to ray cast
/// @param input the ray cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1)
/// @param maskBits mask bit hint: `bool accept = (maskBits & node->categoryBits) != 0;`
/// @param callback a callback class that is called for each proxy that is hit by the ray
/// @param context user context that is passed to the callback
///	@return performance data
DynamicTree_RayCast :: (tree: *DynamicTree, input: *RayCastInput, maskBits: u64, callback: TreeRayCastCallbackFcn, _context: *void) -> TreeStats #foreign box2d "b2DynamicTree_RayCast";

/// This function receives clipped ray cast input for a proxy. The function
/// returns the new ray fraction.
/// - return a value of 0 to terminate the ray cast
/// - return a value less than input->maxFraction to clip the ray
/// - return a value of input->maxFraction to continue the ray cast without clipping
TreeShapeCastCallbackFcn :: #type (input: *ShapeCastInput, proxyId: s32, userData: u64, _context: *void) -> float #c_call;

/// Ray cast against the proxies in the tree. This relies on the callback
/// to perform a exact ray cast in the case were the proxy contains a shape.
/// The callback also performs the any collision filtering. This has performance
/// roughly equal to k * log(n), where k is the number of collisions and n is the
/// number of proxies in the tree.
/// @param tree the dynamic tree to ray cast
/// @param input the ray cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1).
/// @param maskBits filter bits: `bool accept = (maskBits & node->categoryBits) != 0;`
/// @param callback a callback class that is called for each proxy that is hit by the shape
/// @param context user context that is passed to the callback
///	@return performance data
DynamicTree_ShapeCast :: (tree: *DynamicTree, input: *ShapeCastInput, maskBits: u64, callback: TreeShapeCastCallbackFcn, _context: *void) -> TreeStats #foreign box2d "b2DynamicTree_ShapeCast";

/// Get the height of the binary tree.
DynamicTree_GetHeight :: (tree: *DynamicTree) -> s32 #foreign box2d "b2DynamicTree_GetHeight";

/// Get the ratio of the sum of the node areas to the root area.
DynamicTree_GetAreaRatio :: (tree: *DynamicTree) -> float #foreign box2d "b2DynamicTree_GetAreaRatio";

/// Get the bounding box that contains the entire tree
DynamicTree_GetRootBounds :: (tree: *DynamicTree) -> AABB #foreign box2d "b2DynamicTree_GetRootBounds";

/// Get the number of proxies created
DynamicTree_GetProxyCount :: (tree: *DynamicTree) -> s32 #foreign box2d "b2DynamicTree_GetProxyCount";

/// Rebuild the tree while retaining subtrees that haven't changed. Returns the number of boxes sorted.
DynamicTree_Rebuild :: (tree: *DynamicTree, fullBuild: bool) -> s32 #foreign box2d "b2DynamicTree_Rebuild";

/// Get the number of bytes used by this tree
DynamicTree_GetByteCount :: (tree: *DynamicTree) -> s32 #foreign box2d "b2DynamicTree_GetByteCount";

/// Get proxy user data
DynamicTree_GetUserData :: (tree: *DynamicTree, proxyId: s32) -> u64 #foreign box2d "b2DynamicTree_GetUserData";

/// Get the AABB of a proxy
DynamicTree_GetAABB :: (tree: *DynamicTree, proxyId: s32) -> AABB #foreign box2d "b2DynamicTree_GetAABB";

/// Validate this tree. For testing.
DynamicTree_Validate :: (tree: *DynamicTree) -> void #foreign box2d "b2DynamicTree_Validate";

/// Validate this tree has no enlarged AABBs. For testing.
DynamicTree_ValidateNoEnlarged :: (tree: *DynamicTree) -> void #foreign box2d "b2DynamicTree_ValidateNoEnlarged";

/// These are the collision planes returned from b2World_CollideMover
PlaneResult :: struct {
    /// The collision plane between the mover and a convex shape
    plane: Plane;

    // The collision point on the shape.
    point: Vec2;

    /// Did the collision register a hit? If not this plane should be ignored.
    hit:   bool;
}

/// These are collision planes that can be fed to b2SolvePlanes. Normally
/// this is assembled by the user from plane results in b2PlaneResult
CollisionPlane :: struct {
    /// The collision plane between the mover and some shape
    plane:        Plane;

    /// Setting this to FLT_MAX makes the plane as rigid as possible. Lower values can
    /// make the plane collision soft. Usually in meters.
    pushLimit:    float;

    /// The push on the mover determined by b2SolvePlanes. Usually in meters.
    push:         float;

    /// Indicates if b2ClipVector should clip against this plane. Should be false for soft collision.
    clipVelocity: bool;
}

/// Result returned by b2SolvePlanes
PlaneSolverResult :: struct {
    /// The translation of the mover
    translation:    Vec2;

    /// The number of iterations used by the plane solver. For diagnostics.
    iterationCount: s32;
}

/// Solves the position of a mover that satisfies the given collision planes.
/// @param targetDelta the desired movement from the position used to generate the collision planes
/// @param planes the collision planes
/// @param count the number of collision planes
SolvePlanes :: (targetDelta: Vec2, planes: *CollisionPlane, count: s32) -> PlaneSolverResult #foreign box2d "b2SolvePlanes";

/// Clips the velocity against the given collision planes. Planes with zero push or clipVelocity
/// set to false are skipped.
ClipVector :: (vector: Vec2, planes: *CollisionPlane, count: s32) -> Vec2 #foreign box2d "b2ClipVector";

/// World id references a world instance. This should be treated as an opaque handle.
WorldId :: struct {
    index1:     u16;
    generation: u16;
}

/// Body id references a body instance. This should be treated as an opaque handle.
BodyId :: struct {
    index1:     s32;
    world0:     u16;
    generation: u16;
}

/// Shape id references a shape instance. This should be treated as an opaque handle.
ShapeId :: struct {
    index1:     s32;
    world0:     u16;
    generation: u16;
}

/// Chain id references a chain instances. This should be treated as an opaque handle.
ChainId :: struct {
    index1:     s32;
    world0:     u16;
    generation: u16;
}

/// Joint id references a joint instance. This should be treated as an opaque handle.
JointId :: struct {
    index1:     s32;
    world0:     u16;
    generation: u16;
}

/// Store a world id into a uint32_t.
StoreWorldId :: (id: WorldId) -> u32 #foreign box2d "b2StoreWorldId";

/// Load a uint32_t into a world id.
LoadWorldId :: (x: u32) -> WorldId #foreign box2d "b2LoadWorldId";

/// Store a body id into a uint64_t.
StoreBodyId :: (id: BodyId) -> u64 #foreign box2d "b2StoreBodyId";

/// Load a uint64_t into a body id.
LoadBodyId :: (x: u64) -> BodyId #foreign box2d "b2LoadBodyId";

/// Store a shape id into a uint64_t.
StoreShapeId :: (id: ShapeId) -> u64 #foreign box2d "b2StoreShapeId";

/// Load a uint64_t into a shape id.
LoadShapeId :: (x: u64) -> ShapeId #foreign box2d "b2LoadShapeId";

/// Store a chain id into a uint64_t.
StoreChainId :: (id: ChainId) -> u64 #foreign box2d "b2StoreChainId";

/// Load a uint64_t into a chain id.
LoadChainId :: (x: u64) -> ChainId #foreign box2d "b2LoadChainId";

/// Store a joint id into a uint64_t.
StoreJointId :: (id: JointId) -> u64 #foreign box2d "b2StoreJointId";

/// Load a uint64_t into a joint id.
LoadJointId :: (x: u64) -> JointId #foreign box2d "b2LoadJointId";

/// Task interface
/// This is prototype for a Box2D task. Your task system is expected to invoke the Box2D task with these arguments.
/// The task spans a range of the parallel-for: [startIndex, endIndex)
/// The worker index must correctly identify each worker in the user thread pool, expected in [0, workerCount).
/// A worker must only exist on only one thread at a time and is analogous to the thread index.
/// The task context is the context pointer sent from Box2D when it is enqueued.
/// The startIndex and endIndex are expected in the range [0, itemCount) where itemCount is the argument to b2EnqueueTaskCallback
/// below. Box2D expects startIndex < endIndex and will execute a loop like this:
///
/// @code{.c}
/// for (int i = startIndex; i < endIndex; ++i)
/// {
/// 	DoWork();
/// }
/// @endcode
/// @ingroup world
TaskCallback :: #type (startIndex: s32, endIndex: s32, workerIndex: u32, taskContext: *void) -> void #c_call;

/// These functions can be provided to Box2D to invoke a task system. These are designed to work well with enkiTS.
/// Returns a pointer to the user's task object. May be nullptr. A nullptr indicates to Box2D that the work was executed
/// serially within the callback and there is no need to call b2FinishTaskCallback.
/// The itemCount is the number of Box2D work items that are to be partitioned among workers by the user's task system.
/// This is essentially a parallel-for. The minRange parameter is a suggestion of the minimum number of items to assign
/// per worker to reduce overhead. For example, suppose the task is small and that itemCount is 16. A minRange of 8 suggests
/// that your task system should split the work items among just two workers, even if you have more available.
/// In general the range [startIndex, endIndex) send to b2TaskCallback should obey:
/// endIndex - startIndex >= minRange
/// The exception of course is when itemCount < minRange.
/// @ingroup world
EnqueueTaskCallback :: #type (task: TaskCallback, itemCount: s32, minRange: s32, taskContext: *void, userContext: *void) -> *void #c_call;

/// Finishes a user task object that wraps a Box2D task.
/// @ingroup world
FinishTaskCallback :: #type (userTask: *void, userContext: *void) -> void #c_call;

/// Optional friction mixing callback. This intentionally provides no context objects because this is called
/// from a worker thread.
/// @warning This function should not attempt to modify Box2D state or user application state.
/// @ingroup world
FrictionCallback :: #type (frictionA: float, userMaterialIdA: s32, frictionB: float, userMaterialIdB: s32) -> float #c_call;

/// Optional restitution mixing callback. This intentionally provides no context objects because this is called
/// from a worker thread.
/// @warning This function should not attempt to modify Box2D state or user application state.
/// @ingroup world
RestitutionCallback :: #type (restitutionA: float, userMaterialIdA: s32, restitutionB: float, userMaterialIdB: s32) -> float #c_call;

/// Result from b2World_RayCastClosest
/// If there is initial overlap the fraction and normal will be zero while the point is an arbitrary point in the overlap region.
/// @ingroup world
RayResult :: struct {
    shapeId:    ShapeId;
    point:      Vec2;
    normal:     Vec2;
    fraction:   float;
    nodeVisits: s32;
    leafVisits: s32;
    hit:        bool;
}

/// World definition used to create a simulation world.
/// Must be initialized using b2DefaultWorldDef().
/// @ingroup world
WorldDef :: struct {
    /// Gravity vector. Box2D has no up-vector defined.
    gravity:              Vec2;

    /// Restitution speed threshold, usually in m/s. Collisions above this
    /// speed have restitution applied (will bounce).
    restitutionThreshold: float;

    /// Threshold speed for hit events. Usually meters per second.
    hitEventThreshold:    float;

    /// Contact stiffness. Cycles per second. Increasing this increases the speed of overlap recovery, but can introduce jitter.
    contactHertz:         float;

    /// Contact bounciness. Non-dimensional. You can speed up overlap recovery by decreasing this with
    /// the trade-off that overlap resolution becomes more energetic.
    contactDampingRatio:  float;

    /// This parameter controls how fast overlap is resolved and usually has units of meters per second. This only
    /// puts a cap on the resolution speed. The resolution speed is increased by increasing the hertz and/or
    /// decreasing the damping ratio.
    maxContactPushSpeed:  float;

    /// Maximum linear speed. Usually meters per second.
    maximumLinearSpeed:   float;

    /// Optional mixing callback for friction. The default uses sqrt(frictionA * frictionB).
    frictionCallback:     FrictionCallback;

    /// Optional mixing callback for restitution. The default uses max(restitutionA, restitutionB).
    restitutionCallback:  RestitutionCallback;

    /// Can bodies go to sleep to improve performance
    enableSleep:          bool;

    /// Enable continuous collision
    enableContinuous:     bool;

    /// Number of workers to use with the provided task system. Box2D performs best when using only
    /// performance cores and accessing a single L2 cache. Efficiency cores and hyper-threading provide
    /// little benefit and may even harm performance.
    /// @note Box2D does not create threads. This is the number of threads your applications has created
    /// that you are allocating to b2World_Step.
    /// @warning Do not modify the default value unless you are also providing a task system and providing
    /// task callbacks (enqueueTask and finishTask).
    workerCount:          s32;

    /// Function to spawn tasks
    enqueueTask:          EnqueueTaskCallback;

    /// Function to finish a task
    finishTask:           FinishTaskCallback;

    /// User context that is provided to enqueueTask and finishTask
    userTaskContext:      *void;

    /// User data
    userData:             *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:        s32;
}

/// Use this to initialize your world definition
/// @ingroup world
DefaultWorldDef :: () -> WorldDef #foreign box2d "b2DefaultWorldDef";

/// The body simulation type.
/// Each body is one of these three types. The type determines how the body behaves in the simulation.
/// @ingroup body
BodyType :: enum u32 {
    staticBody    :: 0;

    kinematicBody :: 1;

    dynamicBody   :: 2;

    bodyTypeCount :: 3;

    b2_staticBody    :: staticBody;

    b2_kinematicBody :: kinematicBody;

    b2_dynamicBody   :: dynamicBody;

    b2_bodyTypeCount :: bodyTypeCount;
}

/// A body definition holds all the data needed to construct a rigid body.
/// You can safely re-use body definitions. Shapes are added to a body after construction.
/// Body definitions are temporary objects used to bundle creation parameters.
/// Must be initialized using b2DefaultBodyDef().
/// @ingroup body
BodyDef :: struct {
    /// The body type: static, kinematic, or dynamic.
    type:              BodyType;

    /// The initial world position of the body. Bodies should be created with the desired position.
    /// @note Creating bodies at the origin and then moving them nearly doubles the cost of body creation, especially
    /// if the body is moved after shapes have been added.
    position:          Vec2;

    /// The initial world rotation of the body. Use b2MakeRot() if you have an angle.
    rotation:          Rot;

    /// The initial linear velocity of the body's origin. Usually in meters per second.
    linearVelocity:    Vec2;

    /// The initial angular velocity of the body. Radians per second.
    angularVelocity:   float;

    /// Linear damping is used to reduce the linear velocity. The damping parameter
    /// can be larger than 1 but the damping effect becomes sensitive to the
    /// time step when the damping parameter is large.
    /// Generally linear damping is undesirable because it makes objects move slowly
    /// as if they are floating.
    linearDamping:     float;

    /// Angular damping is used to reduce the angular velocity. The damping parameter
    /// can be larger than 1.0f but the damping effect becomes sensitive to the
    /// time step when the damping parameter is large.
    /// Angular damping can be use slow down rotating bodies.
    angularDamping:    float;

    /// Scale the gravity applied to this body. Non-dimensional.
    gravityScale:      float;

    /// Sleep speed threshold, default is 0.05 meters per second
    sleepThreshold:    float;

    /// Optional body name for debugging. Up to 31 characters (excluding null termination)
    name:              *u8;

    /// Use this to store application specific body data.
    userData:          *void;

    /// Set this flag to false if this body should never fall asleep.
    enableSleep:       bool;

    /// Is this body initially awake or sleeping?
    isAwake:           bool;

    /// Should this body be prevented from rotating? Useful for characters.
    fixedRotation:     bool;

    /// Treat this body as high speed object that performs continuous collision detection
    /// against dynamic and kinematic bodies, but not other bullet bodies.
    /// @warning Bullets should be used sparingly. They are not a solution for general dynamic-versus-dynamic
    /// continuous collision. They may interfere with joint constraints.
    isBullet:          bool;

    /// Used to disable a body. A disabled body does not move or collide.
    isEnabled:         bool;

    /// This allows this body to bypass rotational speed limits. Should only be used
    /// for circular objects, like wheels.
    allowFastRotation: bool;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:     s32;
}

/// Use this to initialize your body definition
/// @ingroup body
DefaultBodyDef :: () -> BodyDef #foreign box2d "b2DefaultBodyDef";

/// This is used to filter collision on shapes. It affects shape-vs-shape collision
/// and shape-versus-query collision (such as b2World_CastRay).
/// @ingroup shape
Filter :: struct {
    /// The collision category bits. Normally you would just set one bit. The category bits should
    /// represent your application object types. For example:
    /// @code{.cpp}
    /// enum MyCategories
    /// {
    ///    Static  = 0x00000001,
    ///    Dynamic = 0x00000002,
    ///    Debris  = 0x00000004,
    ///    Player  = 0x00000008,
    ///    // etc
    /// };
    /// @endcode
    categoryBits: u64;

    /// The collision mask bits. This states the categories that this
    /// shape would accept for collision.
    /// For example, you may want your player to only collide with static objects
    /// and other players.
    /// @code{.c}
    /// maskBits = Static | Player;
    /// @endcode
    maskBits:     u64;

    /// Collision groups allow a certain group of objects to never collide (negative)
    /// or always collide (positive). A group index of zero has no effect. Non-zero group filtering
    /// always wins against the mask bits.
    /// For example, you may want ragdolls to collide with other ragdolls but you don't want
    /// ragdoll self-collision. In this case you would give each ragdoll a unique negative group index
    /// and apply that group index to all shapes on the ragdoll.
    groupIndex:   s32;
}

/// Use this to initialize your filter
/// @ingroup shape
DefaultFilter :: () -> Filter #foreign box2d "b2DefaultFilter";

/// The query filter is used to filter collisions between queries and shapes. For example,
/// you may want a ray-cast representing a projectile to hit players and the static environment
/// but not debris.
/// @ingroup shape
QueryFilter :: struct {
    /// The collision category bits of this query. Normally you would just set one bit.
    categoryBits: u64;

    /// The collision mask bits. This states the shape categories that this
    /// query would accept for collision.
    maskBits:     u64;
}

/// Use this to initialize your query filter
/// @ingroup shape
DefaultQueryFilter :: () -> QueryFilter #foreign box2d "b2DefaultQueryFilter";

/// Shape type
/// @ingroup shape
ShapeType :: enum u32 {
    circleShape       :: 0;

    capsuleShape      :: 1;

    segmentShape      :: 2;

    polygonShape      :: 3;

    chainSegmentShape :: 4;

    shapeTypeCount    :: 5;

    b2_circleShape       :: circleShape;

    b2_capsuleShape      :: capsuleShape;

    b2_segmentShape      :: segmentShape;

    b2_polygonShape      :: polygonShape;

    b2_chainSegmentShape :: chainSegmentShape;

    b2_shapeTypeCount    :: shapeTypeCount;
}

/// Surface materials allow chain shapes to have per segment surface properties.
/// @ingroup shape
SurfaceMaterial :: struct {
    /// The Coulomb (dry) friction coefficient, usually in the range [0,1].
    friction:          float;

    /// The coefficient of restitution (bounce) usually in the range [0,1].
    /// https://en.wikipedia.org/wiki/Coefficient_of_restitution
    restitution:       float;

    /// The rolling resistance usually in the range [0,1].
    rollingResistance: float;

    /// The tangent speed for conveyor belts
    tangentSpeed:      float;

    /// User material identifier. This is passed with query results and to friction and restitution
    /// combining functions. It is not used internally.
    userMaterialId:    s32;

    /// Custom debug draw color.
    customColor:       u32;
}

/// Use this to initialize your surface material
/// @ingroup shape
DefaultSurfaceMaterial :: () -> SurfaceMaterial #foreign box2d "b2DefaultSurfaceMaterial";

/// Used to create a shape.
/// This is a temporary object used to bundle shape creation parameters. You may use
/// the same shape definition to create multiple shapes.
/// Must be initialized using b2DefaultShapeDef().
/// @ingroup shape
ShapeDef :: struct {
    /// Use this to store application specific shape data.
    userData:              *void;

    /// The surface material for this shape.
    material:              SurfaceMaterial;

    /// The density, usually in kg/m^2.
    /// This is not part of the surface material because this is for the interior, which may have
    /// other considerations, such as being hollow. For example a wood barrel may be hollow or full of water.
    density:               float;

    /// Collision filtering data.
    filter:                Filter;

    /// A sensor shape generates overlap events but never generates a collision response.
    /// Sensors do not have continuous collision. Instead, use a ray or shape cast for those scenarios.
    /// Sensors still contribute to the body mass if they have non-zero density.
    /// @note Sensor events are disabled by default.
    /// @see enableSensorEvents
    isSensor:              bool;

    /// Enable sensor events for this shape. This applies to sensors and non-sensors. False by default, even for sensors.
    enableSensorEvents:    bool;

    /// Enable contact events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors. False by default.
    enableContactEvents:   bool;

    /// Enable hit events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors. False by default.
    enableHitEvents:       bool;

    /// Enable pre-solve contact events for this shape. Only applies to dynamic bodies. These are expensive
    /// and must be carefully handled due to threading. Ignored for sensors.
    enablePreSolveEvents:  bool;

    /// When shapes are created they will scan the environment for collision the next time step. This can significantly slow down
    /// static body creation when there are many static shapes.
    /// This is flag is ignored for dynamic and kinematic shapes which always invoke contact creation.
    invokeContactCreation: bool;

    /// Should the body update the mass properties when this shape is created. Default is true.
    updateBodyMass:        bool;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:         s32;
}

/// Use this to initialize your shape definition
/// @ingroup shape
DefaultShapeDef :: () -> ShapeDef #foreign box2d "b2DefaultShapeDef";

/// Used to create a chain of line segments. This is designed to eliminate ghost collisions with some limitations.
/// - chains are one-sided
/// - chains have no mass and should be used on static bodies
/// - chains have a counter-clockwise winding order (normal points right of segment direction)
/// - chains are either a loop or open
/// - a chain must have at least 4 points
/// - the distance between any two points must be greater than B2_LINEAR_SLOP
/// - a chain shape should not self intersect (this is not validated)
/// - an open chain shape has NO COLLISION on the first and final edge
/// - you may overlap two open chains on their first three and/or last three points to get smooth collision
/// - a chain shape creates multiple line segment shapes on the body
/// https://en.wikipedia.org/wiki/Polygonal_chain
/// Must be initialized using b2DefaultChainDef().
/// @warning Do not use chain shapes unless you understand the limitations. This is an advanced feature.
/// @ingroup shape
ChainDef :: struct {
    /// Use this to store application specific shape data.
    userData:           *void;

    /// An array of at least 4 points. These are cloned and may be temporary.
    points:             *Vec2;

    /// The point count, must be 4 or more.
    count:              s32;

    /// Surface materials for each segment. These are cloned.
    materials:          *SurfaceMaterial;

    /// The material count. Must be 1 or count. This allows you to provide one
    /// material for all segments or a unique material per segment.
    materialCount:      s32;

    /// Contact filtering data.
    filter:             Filter;

    /// Indicates a closed chain formed by connecting the first and last points
    isLoop:             bool;

    /// Enable sensors to detect this chain. False by default.
    enableSensorEvents: bool;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:      s32;
}

/// Use this to initialize your chain definition
/// @ingroup shape
DefaultChainDef :: () -> ChainDef #foreign box2d "b2DefaultChainDef";

//! @cond
/// Profiling data. Times are in milliseconds.
Profile :: struct {
    step:                float;
    pairs:               float;
    collide:             float;
    solve:               float;
    mergeIslands:        float;
    prepareStages:       float;
    solveConstraints:    float;
    prepareConstraints:  float;
    integrateVelocities: float;
    warmStart:           float;
    solveImpulses:       float;
    integratePositions:  float;
    relaxImpulses:       float;
    applyRestitution:    float;
    storeImpulses:       float;
    splitIslands:        float;
    transforms:          float;
    hitEvents:           float;
    refit:               float;
    bullets:             float;
    sleepIslands:        float;
    sensors:             float;
}

/// Counters that give details of the simulation size.
Counters :: struct {
    bodyCount:        s32;
    shapeCount:       s32;
    contactCount:     s32;
    jointCount:       s32;
    islandCount:      s32;
    stackUsed:        s32;
    staticTreeHeight: s32;
    treeHeight:       s32;
    byteCount:        s32;
    taskCount:        s32;
    colorCounts:      [12] s32;
}

/// Joint type enumeration
///
/// This is useful because all joint types use b2JointId and sometimes you
/// want to get the type of a joint.
/// @ingroup joint
JointType :: enum u32 {
    distanceJoint  :: 0;
    filterJoint    :: 1;
    motorJoint     :: 2;
    mouseJoint     :: 3;
    prismaticJoint :: 4;
    revoluteJoint  :: 5;
    weldJoint      :: 6;
    wheelJoint     :: 7;

    b2_distanceJoint  :: distanceJoint;
    b2_filterJoint    :: filterJoint;
    b2_motorJoint     :: motorJoint;
    b2_mouseJoint     :: mouseJoint;
    b2_prismaticJoint :: prismaticJoint;
    b2_revoluteJoint  :: revoluteJoint;
    b2_weldJoint      :: weldJoint;
    b2_wheelJoint     :: wheelJoint;
}

/// Distance joint definition
///
/// This requires defining an anchor point on both
/// bodies and the non-zero distance of the distance joint. The definition uses
/// local anchor points so that the initial configuration can violate the
/// constraint slightly. This helps when saving and loading a game.
/// @ingroup distance_joint
DistanceJointDef :: struct {
    /// The first attached body
    bodyIdA:          BodyId;

    /// The second attached body
    bodyIdB:          BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:     Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:     Vec2;

    /// The rest length of this joint. Clamped to a stable minimum value.
    length:           float;

    /// Enable the distance constraint to behave like a spring. If false
    /// then the distance joint will be rigid, overriding the limit and motor.
    enableSpring:     bool;

    /// The spring linear stiffness Hertz, cycles per second
    hertz:            float;

    /// The spring linear damping ratio, non-dimensional
    dampingRatio:     float;

    /// Enable/disable the joint limit
    enableLimit:      bool;

    /// Minimum length. Clamped to a stable minimum value.
    minLength:        float;

    /// Maximum length. Must be greater than or equal to the minimum length.
    maxLength:        float;

    /// Enable/disable the joint motor
    enableMotor:      bool;

    /// The maximum motor force, usually in newtons
    maxMotorForce:    float;

    /// The desired motor speed, usually in meters per second
    motorSpeed:       float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup distance_joint
DefaultDistanceJointDef :: () -> DistanceJointDef #foreign box2d "b2DefaultDistanceJointDef";

/// A motor joint is used to control the relative motion between two bodies
///
/// A typical usage is to control the movement of a dynamic body with respect to the ground.
/// @ingroup motor_joint
MotorJointDef :: struct {
    /// The first attached body
    bodyIdA:          BodyId;

    /// The second attached body
    bodyIdB:          BodyId;

    /// Position of bodyB minus the position of bodyA, in bodyA's frame
    linearOffset:     Vec2;

    /// The bodyB angle minus bodyA angle in radians
    angularOffset:    float;

    /// The maximum motor force in newtons
    maxForce:         float;

    /// The maximum motor torque in newton-meters
    maxTorque:        float;

    /// Position correction factor in the range [0,1]
    correctionFactor: float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup motor_joint
DefaultMotorJointDef :: () -> MotorJointDef #foreign box2d "b2DefaultMotorJointDef";

/// A mouse joint is used to make a point on a body track a specified world point.
///
/// This a soft constraint and allows the constraint to stretch without
/// applying huge forces. This also applies rotation constraint heuristic to improve control.
/// @ingroup mouse_joint
MouseJointDef :: struct {
    /// The first attached body. This is assumed to be static.
    bodyIdA:          BodyId;

    /// The second attached body.
    bodyIdB:          BodyId;

    /// The initial target point in world space
    target:           Vec2;

    /// Stiffness in hertz
    hertz:            float;

    /// Damping ratio, non-dimensional
    dampingRatio:     float;

    /// Maximum force, typically in newtons
    maxForce:         float;

    /// Set this flag to true if the attached bodies should collide.
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup mouse_joint
DefaultMouseJointDef :: () -> MouseJointDef #foreign box2d "b2DefaultMouseJointDef";

/// A filter joint is used to disable collision between two specific bodies.
///
/// @ingroup filter_joint
FilterJointDef :: struct {
    /// The first attached body.
    bodyIdA:       BodyId;

    /// The second attached body.
    bodyIdB:       BodyId;

    /// User data pointer
    userData:      *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue: s32;
}

/// Use this to initialize your joint definition
/// @ingroup filter_joint
DefaultFilterJointDef :: () -> FilterJointDef #foreign box2d "b2DefaultFilterJointDef";

/// Prismatic joint definition
///
/// This requires defining a line of motion using an axis and an anchor point.
/// The definition uses local anchor points and a local axis so that the initial
/// configuration can violate the constraint slightly. The joint translation is zero
/// when the local anchor points coincide in world space.
/// @ingroup prismatic_joint
PrismaticJointDef :: struct {
    /// The first attached body
    bodyIdA:           BodyId;

    /// The second attached body
    bodyIdB:           BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:      Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:      Vec2;

    /// The local translation unit axis in bodyA
    localAxisA:        Vec2;

    /// The constrained angle between the bodies: bodyB_angle - bodyA_angle
    referenceAngle:    float;

    /// The target translation for the joint in meters. The spring-damper will drive
    /// to this translation.
    targetTranslation: float;

    /// Enable a linear spring along the prismatic joint axis
    enableSpring:      bool;

    /// The spring stiffness Hertz, cycles per second
    hertz:             float;

    /// The spring damping ratio, non-dimensional
    dampingRatio:      float;

    /// Enable/disable the joint limit
    enableLimit:       bool;

    /// The lower translation limit
    lowerTranslation:  float;

    /// The upper translation limit
    upperTranslation:  float;

    /// Enable/disable the joint motor
    enableMotor:       bool;

    /// The maximum motor force, typically in newtons
    maxMotorForce:     float;

    /// The desired motor speed, typically in meters per second
    motorSpeed:        float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected:  bool;

    /// User data pointer
    userData:          *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:     s32;
}

/// Use this to initialize your joint definition
/// @ingroupd prismatic_joint
DefaultPrismaticJointDef :: () -> PrismaticJointDef #foreign box2d "b2DefaultPrismaticJointDef";

/// Revolute joint definition
///
/// This requires defining an anchor point where the bodies are joined.
/// The definition uses local anchor points so that the
/// initial configuration can violate the constraint slightly. You also need to
/// specify the initial relative angle for joint limits. This helps when saving
/// and loading a game.
/// The local anchor points are measured from the body's origin
/// rather than the center of mass because:
/// 1. you might not know where the center of mass will be
/// 2. if you add/remove shapes from a body and recompute the mass, the joints will be broken
/// @ingroup revolute_joint
RevoluteJointDef :: struct {
    /// The first attached body
    bodyIdA:          BodyId;

    /// The second attached body
    bodyIdB:          BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:     Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:     Vec2;

    /// The bodyB angle minus bodyA angle in the reference state (radians).
    /// This defines the zero angle for the joint limit.
    referenceAngle:   float;

    /// The target angle for the joint in radians. The spring-damper will drive
    /// to this angle.
    targetAngle:      float;

    /// Enable a rotational spring on the revolute hinge axis
    enableSpring:     bool;

    /// The spring stiffness Hertz, cycles per second
    hertz:            float;

    /// The spring damping ratio, non-dimensional
    dampingRatio:     float;

    /// A flag to enable joint limits
    enableLimit:      bool;

    /// The lower angle for the joint limit in radians. Minimum of -0.99*pi radians.
    lowerAngle:       float;

    /// The upper angle for the joint limit in radians. Maximum of 0.99*pi radians.
    upperAngle:       float;

    /// A flag to enable the joint motor
    enableMotor:      bool;

    /// The maximum motor torque, typically in newton-meters
    maxMotorTorque:   float;

    /// The desired motor speed in radians per second
    motorSpeed:       float;

    /// Scale the debug draw
    drawSize:         float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition.
/// @ingroup revolute_joint
DefaultRevoluteJointDef :: () -> RevoluteJointDef #foreign box2d "b2DefaultRevoluteJointDef";

/// Weld joint definition
///
/// A weld joint connect to bodies together rigidly. This constraint provides springs to mimic
/// soft-body simulation.
/// @note The approximate solver in Box2D cannot hold many bodies together rigidly
/// @ingroup weld_joint
WeldJointDef :: struct {
    /// The first attached body
    bodyIdA:             BodyId;

    /// The second attached body
    bodyIdB:             BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:        Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:        Vec2;

    /// The bodyB angle minus bodyA angle in the reference state (radians)
    /// todo maybe make this a b2Rot
    referenceAngle:      float;

    /// Linear stiffness expressed as Hertz (cycles per second). Use zero for maximum stiffness.
    linearHertz:         float;

    /// Angular stiffness as Hertz (cycles per second). Use zero for maximum stiffness.
    angularHertz:        float;

    /// Linear damping ratio, non-dimensional. Use 1 for critical damping.
    linearDampingRatio:  float;

    /// Linear damping ratio, non-dimensional. Use 1 for critical damping.
    angularDampingRatio: float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected:    bool;

    /// User data pointer
    userData:            *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:       s32;
}

/// Use this to initialize your joint definition
/// @ingroup weld_joint
DefaultWeldJointDef :: () -> WeldJointDef #foreign box2d "b2DefaultWeldJointDef";

/// Wheel joint definition
///
/// This requires defining a line of motion using an axis and an anchor point.
/// The definition uses local  anchor points and a local axis so that the initial
/// configuration can violate the constraint slightly. The joint translation is zero
/// when the local anchor points coincide in world space.
/// @ingroup wheel_joint
WheelJointDef :: struct {
    /// The first attached body
    bodyIdA:          BodyId;

    /// The second attached body
    bodyIdB:          BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:     Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:     Vec2;

    /// The local translation unit axis in bodyA
    localAxisA:       Vec2;

    /// Enable a linear spring along the local axis
    enableSpring:     bool;

    /// Spring stiffness in Hertz
    hertz:            float;

    /// Spring damping ratio, non-dimensional
    dampingRatio:     float;

    /// Enable/disable the joint linear limit
    enableLimit:      bool;

    /// The lower translation limit
    lowerTranslation: float;

    /// The upper translation limit
    upperTranslation: float;

    /// Enable/disable the joint rotational motor
    enableMotor:      bool;

    /// The maximum motor torque, typically in newton-meters
    maxMotorTorque:   float;

    /// The desired motor speed in radians per second
    motorSpeed:       float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup wheel_joint
DefaultWheelJointDef :: () -> WheelJointDef #foreign box2d "b2DefaultWheelJointDef";

/// The explosion definition is used to configure options for explosions. Explosions
/// consider shape geometry when computing the impulse.
/// @ingroup world
ExplosionDef :: struct {
    /// Mask bits to filter shapes
    maskBits:         u64;

    /// The center of the explosion in world space
    position:         Vec2;

    /// The radius of the explosion
    radius:           float;

    /// The falloff distance beyond the radius. Impulse is reduced to zero at this distance.
    falloff:          float;

    /// Impulse per unit length. This applies an impulse according to the shape perimeter that
    /// is facing the explosion. Explosions only apply to circles, capsules, and polygons. This
    /// may be negative for implosions.
    impulsePerLength: float;
}

/// Use this to initialize your explosion definition
/// @ingroup world
DefaultExplosionDef :: () -> ExplosionDef #foreign box2d "b2DefaultExplosionDef";

/// A begin touch event is generated when a shape starts to overlap a sensor shape.
SensorBeginTouchEvent :: struct {
    /// The id of the sensor shape
    sensorShapeId:  ShapeId;

    /// The id of the dynamic shape that began touching the sensor shape
    visitorShapeId: ShapeId;
}

/// An end touch event is generated when a shape stops overlapping a sensor shape.
///	These include things like setting the transform, destroying a body or shape, or changing
///	a filter. You will also get an end event if the sensor or visitor are destroyed.
///	Therefore you should always confirm the shape id is valid using b2Shape_IsValid.
SensorEndTouchEvent :: struct {
    /// The id of the sensor shape
    ///	@warning this shape may have been destroyed
    ///	@see b2Shape_IsValid
    sensorShapeId:  ShapeId;

    /// The id of the dynamic shape that stopped touching the sensor shape
    ///	@warning this shape may have been destroyed
    ///	@see b2Shape_IsValid
    visitorShapeId: ShapeId;
}

/// Sensor events are buffered in the Box2D world and are available
/// as begin/end overlap event arrays after the time step is complete.
/// Note: these may become invalid if bodies and/or shapes are destroyed
SensorEvents :: struct {
    /// Array of sensor begin touch events
    beginEvents: *SensorBeginTouchEvent;

    /// Array of sensor end touch events
    endEvents:   *SensorEndTouchEvent;

    /// The number of begin touch events
    beginCount:  s32;

    /// The number of end touch events
    endCount:    s32;
}

/// A begin touch event is generated when two shapes begin touching.
ContactBeginTouchEvent :: struct {
    /// Id of the first shape
    shapeIdA: ShapeId;

    /// Id of the second shape
    shapeIdB: ShapeId;

    /// The initial contact manifold. This is recorded before the solver is called,
    /// so all the impulses will be zero.
    manifold: Manifold;
}

/// An end touch event is generated when two shapes stop touching.
///	You will get an end event if you do anything that destroys contacts previous to the last
///	world step. These include things like setting the transform, destroying a body
///	or shape, or changing a filter or body type.
ContactEndTouchEvent :: struct {
    /// Id of the first shape
    ///	@warning this shape may have been destroyed
    ///	@see b2Shape_IsValid
    shapeIdA: ShapeId;

    /// Id of the second shape
    ///	@warning this shape may have been destroyed
    ///	@see b2Shape_IsValid
    shapeIdB: ShapeId;
}

/// A hit touch event is generated when two shapes collide with a speed faster than the hit speed threshold.
/// This may be reported for speculative contacts that have a confirmed impulse.
ContactHitEvent :: struct {
    /// Id of the first shape
    shapeIdA:      ShapeId;

    /// Id of the second shape
    shapeIdB:      ShapeId;

    /// Point where the shapes hit at the beginning of the time step.
    /// This is a mid-point between the two surfaces. It could be at speculative
    /// point where the two shapes were not touching at the beginning of the time step.
    point:         Vec2;

    /// Normal vector pointing from shape A to shape B
    normal:        Vec2;

    /// The speed the shapes are approaching. Always positive. Typically in meters per second.
    approachSpeed: float;
}

/// Contact events are buffered in the Box2D world and are available
/// as event arrays after the time step is complete.
/// Note: these may become invalid if bodies and/or shapes are destroyed
ContactEvents :: struct {
    /// Array of begin touch events
    beginEvents: *ContactBeginTouchEvent;

    /// Array of end touch events
    endEvents:   *ContactEndTouchEvent;

    /// Array of hit events
    hitEvents:   *ContactHitEvent;

    /// Number of begin touch events
    beginCount:  s32;

    /// Number of end touch events
    endCount:    s32;

    /// Number of hit events
    hitCount:    s32;
}

/// Body move events triggered when a body moves.
/// Triggered when a body moves due to simulation. Not reported for bodies moved by the user.
/// This also has a flag to indicate that the body went to sleep so the application can also
/// sleep that actor/entity/object associated with the body.
/// On the other hand if the flag does not indicate the body went to sleep then the application
/// can treat the actor/entity/object associated with the body as awake.
/// This is an efficient way for an application to update game object transforms rather than
/// calling functions such as b2Body_GetTransform() because this data is delivered as a contiguous array
/// and it is only populated with bodies that have moved.
/// @note If sleeping is disabled all dynamic and kinematic bodies will trigger move events.
BodyMoveEvent :: struct {
    transform:  Transform;
    bodyId:     BodyId;
    userData:   *void;
    fellAsleep: bool;
}

/// Body events are buffered in the Box2D world and are available
/// as event arrays after the time step is complete.
/// Note: this data becomes invalid if bodies are destroyed
BodyEvents :: struct {
    /// Array of move events
    moveEvents: *BodyMoveEvent;

    /// Number of move events
    moveCount:  s32;
}

/// The contact data for two shapes. By convention the manifold normal points
/// from shape A to shape B.
/// @see b2Shape_GetContactData() and b2Body_GetContactData()
ContactData :: struct {
    shapeIdA: ShapeId;
    shapeIdB: ShapeId;
    manifold: Manifold;
}

/// Prototype for a contact filter callback.
/// This is called when a contact pair is considered for collision. This allows you to
/// perform custom logic to prevent collision between shapes. This is only called if
/// one of the two shapes has custom filtering enabled.
/// Notes:
/// - this function must be thread-safe
/// - this is only called if one of the two shapes has enabled custom filtering
/// - this is called only for awake dynamic bodies
/// Return false if you want to disable the collision
/// @see b2ShapeDef
/// @warning Do not attempt to modify the world inside this callback
/// @ingroup world
CustomFilterFcn :: #type (shapeIdA: ShapeId, shapeIdB: ShapeId, _context: *void) -> bool #c_call;

/// Prototype for a pre-solve callback.
/// This is called after a contact is updated. This allows you to inspect a
/// contact before it goes to the solver. If you are careful, you can modify the
/// contact manifold (e.g. modify the normal).
/// Notes:
/// - this function must be thread-safe
/// - this is only called if the shape has enabled pre-solve events
/// - this is called only for awake dynamic bodies
/// - this is not called for sensors
/// - the supplied manifold has impulse values from the previous step
/// Return false if you want to disable the contact this step
/// @warning Do not attempt to modify the world inside this callback
/// @ingroup world
PreSolveFcn :: #type (shapeIdA: ShapeId, shapeIdB: ShapeId, manifold: *Manifold, _context: *void) -> bool #c_call;

/// Prototype callback for overlap queries.
/// Called for each shape found in the query.
/// @see b2World_OverlapABB
/// @return false to terminate the query.
/// @ingroup world
OverlapResultFcn :: #type (shapeId: ShapeId, _context: *void) -> bool #c_call;

/// Prototype callback for ray and shape casts.
/// Called for each shape found in the query. You control how the ray cast
/// proceeds by returning a float:
/// return -1: ignore this shape and continue
/// return 0: terminate the ray cast
/// return fraction: clip the ray to this point
/// return 1: don't clip the ray and continue
/// A cast with initial overlap will return a zero fraction and a zero normal.
/// @param shapeId the shape hit by the ray
/// @param point the point of initial intersection
/// @param normal the normal vector at the point of intersection, zero for a shape cast with initial overlap
/// @param fraction the fraction along the ray at the point of intersection, zero for a shape cast with initial overlap
/// @param context the user context
/// @return -1 to filter, 0 to terminate, fraction to clip the ray for closest hit, 1 to continue
/// @see b2World_CastRay
/// @ingroup world
CastResultFcn :: #type (shapeId: ShapeId, point: Vec2, normal: Vec2, fraction: float, _context: *void) -> float #c_call;

// Used to collect collision planes for character movers.
// Return true to continue gathering planes.
PlaneResultFcn :: #type (shapeId: ShapeId, plane: *PlaneResult, _context: *void) -> bool #c_call;

/// These colors are used for debug draw and mostly match the named SVG colors.
/// See https://www.rapidtables.com/web/color/index.html
/// https://johndecember.com/html/spec/colorsvg.html
/// https://upload.wikimedia.org/wikipedia/commons/2/2b/SVG_Recognized_color_keyword_names.svg
HexColor :: enum u32 {
    AliceBlue            :: 15792383;
    AntiqueWhite         :: 16444375;
    Aqua                 :: 65535;
    Aquamarine           :: 8388564;
    Azure                :: 15794175;
    Beige                :: 16119260;
    Bisque               :: 16770244;
    Black                :: 0;
    BlanchedAlmond       :: 16772045;
    Blue                 :: 255;
    BlueViolet           :: 9055202;
    Brown                :: 10824234;
    Burlywood            :: 14596231;
    CadetBlue            :: 6266528;
    Chartreuse           :: 8388352;
    Chocolate            :: 13789470;
    Coral                :: 16744272;
    CornflowerBlue       :: 6591981;
    Cornsilk             :: 16775388;
    Crimson              :: 14423100;
    Cyan                 :: 65535;
    DarkBlue             :: 139;
    DarkCyan             :: 35723;
    DarkGoldenRod        :: 12092939;
    DarkGray             :: 11119017;
    DarkGreen            :: 25600;
    DarkKhaki            :: 12433259;
    DarkMagenta          :: 9109643;
    DarkOliveGreen       :: 5597999;
    DarkOrange           :: 16747520;
    DarkOrchid           :: 10040012;
    DarkRed              :: 9109504;
    DarkSalmon           :: 15308410;
    DarkSeaGreen         :: 9419919;
    DarkSlateBlue        :: 4734347;
    DarkSlateGray        :: 3100495;
    DarkTurquoise        :: 52945;
    DarkViolet           :: 9699539;
    DeepPink             :: 16716947;
    DeepSkyBlue          :: 49151;
    DimGray              :: 6908265;
    DodgerBlue           :: 2003199;
    FireBrick            :: 11674146;
    FloralWhite          :: 16775920;
    ForestGreen          :: 2263842;
    Fuchsia              :: 16711935;
    Gainsboro            :: 14474460;
    GhostWhite           :: 16316671;
    Gold                 :: 16766720;
    GoldenRod            :: 14329120;
    Gray                 :: 8421504;
    Green                :: 32768;
    GreenYellow          :: 11403055;
    HoneyDew             :: 15794160;
    HotPink              :: 16738740;
    IndianRed            :: 13458524;
    Indigo               :: 4915330;
    Ivory                :: 16777200;
    Khaki                :: 15787660;
    Lavender             :: 15132410;
    LavenderBlush        :: 16773365;
    LawnGreen            :: 8190976;
    LemonChiffon         :: 16775885;
    LightBlue            :: 11393254;
    LightCoral           :: 15761536;
    LightCyan            :: 14745599;
    LightGoldenRodYellow :: 16448210;
    LightGray            :: 13882323;
    LightGreen           :: 9498256;
    LightPink            :: 16758465;
    LightSalmon          :: 16752762;
    LightSeaGreen        :: 2142890;
    LightSkyBlue         :: 8900346;
    LightSlateGray       :: 7833753;
    LightSteelBlue       :: 11584734;
    LightYellow          :: 16777184;
    Lime                 :: 65280;
    LimeGreen            :: 3329330;
    Linen                :: 16445670;
    Magenta              :: 16711935;
    Maroon               :: 8388608;
    MediumAquaMarine     :: 6737322;
    MediumBlue           :: 205;
    MediumOrchid         :: 12211667;
    MediumPurple         :: 9662683;
    MediumSeaGreen       :: 3978097;
    MediumSlateBlue      :: 8087790;
    MediumSpringGreen    :: 64154;
    MediumTurquoise      :: 4772300;
    MediumVioletRed      :: 13047173;
    MidnightBlue         :: 1644912;
    MintCream            :: 16121850;
    MistyRose            :: 16770273;
    Moccasin             :: 16770229;
    NavajoWhite          :: 16768685;
    Navy                 :: 128;
    OldLace              :: 16643558;
    Olive                :: 8421376;
    OliveDrab            :: 7048739;
    Orange               :: 16753920;
    OrangeRed            :: 16729344;
    Orchid               :: 14315734;
    PaleGoldenRod        :: 15657130;
    PaleGreen            :: 10025880;
    PaleTurquoise        :: 11529966;
    PaleVioletRed        :: 14381203;
    PapayaWhip           :: 16773077;
    PeachPuff            :: 16767673;
    Peru                 :: 13468991;
    Pink                 :: 16761035;
    Plum                 :: 14524637;
    PowderBlue           :: 11591910;
    Purple               :: 8388736;
    RebeccaPurple        :: 6697881;
    Red                  :: 16711680;
    RosyBrown            :: 12357519;
    RoyalBlue            :: 4286945;
    SaddleBrown          :: 9127187;
    Salmon               :: 16416882;
    SandyBrown           :: 16032864;
    SeaGreen             :: 3050327;
    SeaShell             :: 16774638;
    Sienna               :: 10506797;
    Silver               :: 12632256;
    SkyBlue              :: 8900331;
    SlateBlue            :: 6970061;
    SlateGray            :: 7372944;
    Snow                 :: 16775930;
    SpringGreen          :: 65407;
    SteelBlue            :: 4620980;
    Tan                  :: 13808780;
    Teal                 :: 32896;
    Thistle              :: 14204888;
    Tomato               :: 16737095;
    Turquoise            :: 4251856;
    Violet               :: 15631086;
    Wheat                :: 16113331;
    White                :: 16777215;
    WhiteSmoke           :: 16119285;
    Yellow               :: 16776960;
    YellowGreen          :: 10145074;

    Box2DRed             :: 14430514;
    Box2DBlue            :: 3190463;
    Box2DGreen           :: 9226532;
    Box2DYellow          :: 16772748;

    b2_colorAliceBlue            :: AliceBlue;
    b2_colorAntiqueWhite         :: AntiqueWhite;
    b2_colorAqua                 :: Aqua;
    b2_colorAquamarine           :: Aquamarine;
    b2_colorAzure                :: Azure;
    b2_colorBeige                :: Beige;
    b2_colorBisque               :: Bisque;
    b2_colorBlack                :: Black;
    b2_colorBlanchedAlmond       :: BlanchedAlmond;
    b2_colorBlue                 :: Blue;
    b2_colorBlueViolet           :: BlueViolet;
    b2_colorBrown                :: Brown;
    b2_colorBurlywood            :: Burlywood;
    b2_colorCadetBlue            :: CadetBlue;
    b2_colorChartreuse           :: Chartreuse;
    b2_colorChocolate            :: Chocolate;
    b2_colorCoral                :: Coral;
    b2_colorCornflowerBlue       :: CornflowerBlue;
    b2_colorCornsilk             :: Cornsilk;
    b2_colorCrimson              :: Crimson;
    b2_colorCyan                 :: Cyan;
    b2_colorDarkBlue             :: DarkBlue;
    b2_colorDarkCyan             :: DarkCyan;
    b2_colorDarkGoldenRod        :: DarkGoldenRod;
    b2_colorDarkGray             :: DarkGray;
    b2_colorDarkGreen            :: DarkGreen;
    b2_colorDarkKhaki            :: DarkKhaki;
    b2_colorDarkMagenta          :: DarkMagenta;
    b2_colorDarkOliveGreen       :: DarkOliveGreen;
    b2_colorDarkOrange           :: DarkOrange;
    b2_colorDarkOrchid           :: DarkOrchid;
    b2_colorDarkRed              :: DarkRed;
    b2_colorDarkSalmon           :: DarkSalmon;
    b2_colorDarkSeaGreen         :: DarkSeaGreen;
    b2_colorDarkSlateBlue        :: DarkSlateBlue;
    b2_colorDarkSlateGray        :: DarkSlateGray;
    b2_colorDarkTurquoise        :: DarkTurquoise;
    b2_colorDarkViolet           :: DarkViolet;
    b2_colorDeepPink             :: DeepPink;
    b2_colorDeepSkyBlue          :: DeepSkyBlue;
    b2_colorDimGray              :: DimGray;
    b2_colorDodgerBlue           :: DodgerBlue;
    b2_colorFireBrick            :: FireBrick;
    b2_colorFloralWhite          :: FloralWhite;
    b2_colorForestGreen          :: ForestGreen;
    b2_colorFuchsia              :: Fuchsia;
    b2_colorGainsboro            :: Gainsboro;
    b2_colorGhostWhite           :: GhostWhite;
    b2_colorGold                 :: Gold;
    b2_colorGoldenRod            :: GoldenRod;
    b2_colorGray                 :: Gray;
    b2_colorGreen                :: Green;
    b2_colorGreenYellow          :: GreenYellow;
    b2_colorHoneyDew             :: HoneyDew;
    b2_colorHotPink              :: HotPink;
    b2_colorIndianRed            :: IndianRed;
    b2_colorIndigo               :: Indigo;
    b2_colorIvory                :: Ivory;
    b2_colorKhaki                :: Khaki;
    b2_colorLavender             :: Lavender;
    b2_colorLavenderBlush        :: LavenderBlush;
    b2_colorLawnGreen            :: LawnGreen;
    b2_colorLemonChiffon         :: LemonChiffon;
    b2_colorLightBlue            :: LightBlue;
    b2_colorLightCoral           :: LightCoral;
    b2_colorLightCyan            :: LightCyan;
    b2_colorLightGoldenRodYellow :: LightGoldenRodYellow;
    b2_colorLightGray            :: LightGray;
    b2_colorLightGreen           :: LightGreen;
    b2_colorLightPink            :: LightPink;
    b2_colorLightSalmon          :: LightSalmon;
    b2_colorLightSeaGreen        :: LightSeaGreen;
    b2_colorLightSkyBlue         :: LightSkyBlue;
    b2_colorLightSlateGray       :: LightSlateGray;
    b2_colorLightSteelBlue       :: LightSteelBlue;
    b2_colorLightYellow          :: LightYellow;
    b2_colorLime                 :: Lime;
    b2_colorLimeGreen            :: LimeGreen;
    b2_colorLinen                :: Linen;
    b2_colorMagenta              :: Magenta;
    b2_colorMaroon               :: Maroon;
    b2_colorMediumAquaMarine     :: MediumAquaMarine;
    b2_colorMediumBlue           :: MediumBlue;
    b2_colorMediumOrchid         :: MediumOrchid;
    b2_colorMediumPurple         :: MediumPurple;
    b2_colorMediumSeaGreen       :: MediumSeaGreen;
    b2_colorMediumSlateBlue      :: MediumSlateBlue;
    b2_colorMediumSpringGreen    :: MediumSpringGreen;
    b2_colorMediumTurquoise      :: MediumTurquoise;
    b2_colorMediumVioletRed      :: MediumVioletRed;
    b2_colorMidnightBlue         :: MidnightBlue;
    b2_colorMintCream            :: MintCream;
    b2_colorMistyRose            :: MistyRose;
    b2_colorMoccasin             :: Moccasin;
    b2_colorNavajoWhite          :: NavajoWhite;
    b2_colorNavy                 :: Navy;
    b2_colorOldLace              :: OldLace;
    b2_colorOlive                :: Olive;
    b2_colorOliveDrab            :: OliveDrab;
    b2_colorOrange               :: Orange;
    b2_colorOrangeRed            :: OrangeRed;
    b2_colorOrchid               :: Orchid;
    b2_colorPaleGoldenRod        :: PaleGoldenRod;
    b2_colorPaleGreen            :: PaleGreen;
    b2_colorPaleTurquoise        :: PaleTurquoise;
    b2_colorPaleVioletRed        :: PaleVioletRed;
    b2_colorPapayaWhip           :: PapayaWhip;
    b2_colorPeachPuff            :: PeachPuff;
    b2_colorPeru                 :: Peru;
    b2_colorPink                 :: Pink;
    b2_colorPlum                 :: Plum;
    b2_colorPowderBlue           :: PowderBlue;
    b2_colorPurple               :: Purple;
    b2_colorRebeccaPurple        :: RebeccaPurple;
    b2_colorRed                  :: Red;
    b2_colorRosyBrown            :: RosyBrown;
    b2_colorRoyalBlue            :: RoyalBlue;
    b2_colorSaddleBrown          :: SaddleBrown;
    b2_colorSalmon               :: Salmon;
    b2_colorSandyBrown           :: SandyBrown;
    b2_colorSeaGreen             :: SeaGreen;
    b2_colorSeaShell             :: SeaShell;
    b2_colorSienna               :: Sienna;
    b2_colorSilver               :: Silver;
    b2_colorSkyBlue              :: SkyBlue;
    b2_colorSlateBlue            :: SlateBlue;
    b2_colorSlateGray            :: SlateGray;
    b2_colorSnow                 :: Snow;
    b2_colorSpringGreen          :: SpringGreen;
    b2_colorSteelBlue            :: SteelBlue;
    b2_colorTan                  :: Tan;
    b2_colorTeal                 :: Teal;
    b2_colorThistle              :: Thistle;
    b2_colorTomato               :: Tomato;
    b2_colorTurquoise            :: Turquoise;
    b2_colorViolet               :: Violet;
    b2_colorWheat                :: Wheat;
    b2_colorWhite                :: White;
    b2_colorWhiteSmoke           :: WhiteSmoke;
    b2_colorYellow               :: Yellow;
    b2_colorYellowGreen          :: YellowGreen;

    b2_colorBox2DRed             :: Box2DRed;
    b2_colorBox2DBlue            :: Box2DBlue;
    b2_colorBox2DGreen           :: Box2DGreen;
    b2_colorBox2DYellow          :: Box2DYellow;
}

/// This struct holds callbacks you can implement to draw a Box2D world.
/// This structure should be zero initialized.
/// @ingroup world
DebugDraw :: struct {
    /// Draw a closed polygon provided in CCW order.
    DrawPolygonFcn:       #type (vertices: *Vec2, vertexCount: s32, color: HexColor, _context: *void) -> void #c_call;

    /// Draw a solid closed polygon provided in CCW order.
    DrawSolidPolygonFcn:  #type (transform: Transform, vertices: *Vec2, vertexCount: s32, radius: float, color: HexColor, _context: *void) -> void #c_call;

    /// Draw a circle.
    DrawCircleFcn:        #type (center: Vec2, radius: float, color: HexColor, _context: *void) -> void #c_call;

    /// Draw a solid circle.
    DrawSolidCircleFcn:   #type (transform: Transform, radius: float, color: HexColor, _context: *void) -> void #c_call;

    /// Draw a solid capsule.
    DrawSolidCapsuleFcn:  #type (p1: Vec2, p2: Vec2, radius: float, color: HexColor, _context: *void) -> void #c_call;

    /// Draw a line segment.
    DrawSegmentFcn:       #type (p1: Vec2, p2: Vec2, color: HexColor, _context: *void) -> void #c_call;

    /// Draw a transform. Choose your own length scale.
    DrawTransformFcn:     #type (transform: Transform, _context: *void) -> void #c_call;

    /// Draw a point.
    DrawPointFcn:         #type (p: Vec2, size: float, color: HexColor, _context: *void) -> void #c_call;

    /// Draw a string in world space
    DrawStringFcn:        #type (p: Vec2, s: *u8, color: HexColor, _context: *void) -> void #c_call;

    /// Bounds to use if restricting drawing to a rectangular region
    drawingBounds:        AABB;

    /// Option to restrict drawing to a rectangular region. May suffer from unstable depth sorting.
    useDrawingBounds:     bool;

    /// Option to draw shapes
    drawShapes:           bool;

    /// Option to draw joints
    drawJoints:           bool;

    /// Option to draw additional information for joints
    drawJointExtras:      bool;

    /// Option to draw the bounding boxes for shapes
    drawBounds:           bool;

    /// Option to draw the mass and center of mass of dynamic bodies
    drawMass:             bool;

    /// Option to draw body names
    drawBodyNames:        bool;

    /// Option to draw contact points
    drawContacts:         bool;

    /// Option to visualize the graph coloring used for contacts and joints
    drawGraphColors:      bool;

    /// Option to draw contact normals
    drawContactNormals:   bool;

    /// Option to draw contact normal impulses
    drawContactImpulses:  bool;

    /// Option to draw contact feature ids
    drawContactFeatures:  bool;

    /// Option to draw contact friction impulses
    drawFrictionImpulses: bool;

    /// Option to draw islands as bounding boxes
    drawIslands:          bool;

    /// User context that is passed as an argument to drawing callback functions
    _context:             *void;
}

/// Use this to initialize your drawing interface. This allows you to implement a sub-set
/// of the drawing functions.
DefaultDebugDraw :: () -> DebugDraw #foreign box2d "b2DefaultDebugDraw";

/// Create a world for rigid body simulation. A world contains bodies, shapes, and constraints. You make create
/// up to 128 worlds. Each world is completely independent and may be simulated in parallel.
/// @return the world id.
CreateWorld :: (def: *WorldDef) -> WorldId #foreign box2d "b2CreateWorld";

/// Destroy a world
DestroyWorld :: (worldId: WorldId) -> void #foreign box2d "b2DestroyWorld";

/// World id validation. Provides validation for up to 64K allocations.
World_IsValid :: (id: WorldId) -> bool #foreign box2d "b2World_IsValid";

/// Simulate a world for one time step. This performs collision detection, integration, and constraint solution.
/// @param worldId The world to simulate
/// @param timeStep The amount of time to simulate, this should be a fixed number. Usually 1/60.
/// @param subStepCount The number of sub-steps, increasing the sub-step count can increase accuracy. Usually 4.
World_Step :: (worldId: WorldId, timeStep: float, subStepCount: s32) -> void #foreign box2d "b2World_Step";

/// Call this to draw shapes and other debug draw data
World_Draw :: (worldId: WorldId, draw: *DebugDraw) -> void #foreign box2d "b2World_Draw";

/// Get the body events for the current time step. The event data is transient. Do not store a reference to this data.
World_GetBodyEvents :: (worldId: WorldId) -> BodyEvents #foreign box2d "b2World_GetBodyEvents";

/// Get sensor events for the current time step. The event data is transient. Do not store a reference to this data.
World_GetSensorEvents :: (worldId: WorldId) -> SensorEvents #foreign box2d "b2World_GetSensorEvents";

/// Get contact events for this current time step. The event data is transient. Do not store a reference to this data.
World_GetContactEvents :: (worldId: WorldId) -> ContactEvents #foreign box2d "b2World_GetContactEvents";

/// Overlap test for all shapes that *potentially* overlap the provided AABB
World_OverlapAABB :: (worldId: WorldId, aabb: AABB, filter: QueryFilter, fcn: OverlapResultFcn, _context: *void) -> TreeStats #foreign box2d "b2World_OverlapAABB";

/// Overlap test for all shapes that overlap the provided shape proxy.
World_OverlapShape :: (worldId: WorldId, proxy: *ShapeProxy, filter: QueryFilter, fcn: OverlapResultFcn, _context: *void) -> TreeStats #foreign box2d "b2World_OverlapShape";

/// Cast a ray into the world to collect shapes in the path of the ray.
/// Your callback function controls whether you get the closest point, any point, or n-points.
/// @note The callback function may receive shapes in any order
/// @param worldId The world to cast the ray against
/// @param origin The start point of the ray
/// @param translation The translation of the ray from the start point to the end point
/// @param filter Contains bit flags to filter unwanted shapes from the results
/// @param fcn A user implemented callback function
/// @param context A user context that is passed along to the callback function
///	@return traversal performance counters
World_CastRay :: (worldId: WorldId, origin: Vec2, translation: Vec2, filter: QueryFilter, fcn: CastResultFcn, _context: *void) -> TreeStats #foreign box2d "b2World_CastRay";

/// Cast a ray into the world to collect the closest hit. This is a convenience function. Ignores initial overlap.
/// This is less general than b2World_CastRay() and does not allow for custom filtering.
World_CastRayClosest :: (worldId: WorldId, origin: Vec2, translation: Vec2, filter: QueryFilter) -> RayResult #foreign box2d "b2World_CastRayClosest";

/// Cast a shape through the world. Similar to a cast ray except that a shape is cast instead of a point.
///	@see b2World_CastRay
World_CastShape :: (worldId: WorldId, proxy: *ShapeProxy, translation: Vec2, filter: QueryFilter, fcn: CastResultFcn, _context: *void) -> TreeStats #foreign box2d "b2World_CastShape";

/// Cast a capsule mover through the world. This is a special shape cast that handles sliding along other shapes while reducing
/// clipping.
World_CastMover :: (worldId: WorldId, mover: *Capsule, translation: Vec2, filter: QueryFilter) -> float #foreign box2d "b2World_CastMover";

/// Collide a capsule mover with the world, gathering collision planes that can be fed to b2SolvePlanes. Useful for
/// kinematic character movement.
World_CollideMover :: (worldId: WorldId, mover: *Capsule, filter: QueryFilter, fcn: PlaneResultFcn, _context: *void) -> void #foreign box2d "b2World_CollideMover";

/// Enable/disable sleep. If your application does not need sleeping, you can gain some performance
/// by disabling sleep completely at the world level.
/// @see b2WorldDef
World_EnableSleeping :: (worldId: WorldId, flag: bool) -> void #foreign box2d "b2World_EnableSleeping";

/// Is body sleeping enabled?
World_IsSleepingEnabled :: (worldId: WorldId) -> bool #foreign box2d "b2World_IsSleepingEnabled";

/// Enable/disable continuous collision between dynamic and static bodies. Generally you should keep continuous
/// collision enabled to prevent fast moving objects from going through static objects. The performance gain from
/// disabling continuous collision is minor.
/// @see b2WorldDef
World_EnableContinuous :: (worldId: WorldId, flag: bool) -> void #foreign box2d "b2World_EnableContinuous";

/// Is continuous collision enabled?
World_IsContinuousEnabled :: (worldId: WorldId) -> bool #foreign box2d "b2World_IsContinuousEnabled";

/// Adjust the restitution threshold. It is recommended not to make this value very small
/// because it will prevent bodies from sleeping. Usually in meters per second.
/// @see b2WorldDef
World_SetRestitutionThreshold :: (worldId: WorldId, value: float) -> void #foreign box2d "b2World_SetRestitutionThreshold";

/// Get the the restitution speed threshold. Usually in meters per second.
World_GetRestitutionThreshold :: (worldId: WorldId) -> float #foreign box2d "b2World_GetRestitutionThreshold";

/// Adjust the hit event threshold. This controls the collision speed needed to generate a b2ContactHitEvent.
/// Usually in meters per second.
/// @see b2WorldDef::hitEventThreshold
World_SetHitEventThreshold :: (worldId: WorldId, value: float) -> void #foreign box2d "b2World_SetHitEventThreshold";

/// Get the the hit event speed threshold. Usually in meters per second.
World_GetHitEventThreshold :: (worldId: WorldId) -> float #foreign box2d "b2World_GetHitEventThreshold";

/// Register the custom filter callback. This is optional.
World_SetCustomFilterCallback :: (worldId: WorldId, fcn: CustomFilterFcn, _context: *void) -> void #foreign box2d "b2World_SetCustomFilterCallback";

/// Register the pre-solve callback. This is optional.
World_SetPreSolveCallback :: (worldId: WorldId, fcn: PreSolveFcn, _context: *void) -> void #foreign box2d "b2World_SetPreSolveCallback";

/// Set the gravity vector for the entire world. Box2D has no concept of an up direction and this
/// is left as a decision for the application. Usually in m/s^2.
/// @see b2WorldDef
World_SetGravity :: (worldId: WorldId, gravity: Vec2) -> void #foreign box2d "b2World_SetGravity";

/// Get the gravity vector
World_GetGravity :: (worldId: WorldId) -> Vec2 #foreign box2d "b2World_GetGravity";

/// Apply a radial explosion
/// @param worldId The world id
/// @param explosionDef The explosion definition
World_Explode :: (worldId: WorldId, explosionDef: *ExplosionDef) -> void #foreign box2d "b2World_Explode";

/// Adjust contact tuning parameters
/// @param worldId The world id
/// @param hertz The contact stiffness (cycles per second)
/// @param dampingRatio The contact bounciness with 1 being critical damping (non-dimensional)
/// @param pushSpeed The maximum contact constraint push out speed (meters per second)
/// @note Advanced feature
World_SetContactTuning :: (worldId: WorldId, hertz: float, dampingRatio: float, pushSpeed: float) -> void #foreign box2d "b2World_SetContactTuning";

/// Set the maximum linear speed. Usually in m/s.
World_SetMaximumLinearSpeed :: (worldId: WorldId, maximumLinearSpeed: float) -> void #foreign box2d "b2World_SetMaximumLinearSpeed";

/// Get the maximum linear speed. Usually in m/s.
World_GetMaximumLinearSpeed :: (worldId: WorldId) -> float #foreign box2d "b2World_GetMaximumLinearSpeed";

/// Enable/disable constraint warm starting. Advanced feature for testing. Disabling
/// warm starting greatly reduces stability and provides no performance gain.
World_EnableWarmStarting :: (worldId: WorldId, flag: bool) -> void #foreign box2d "b2World_EnableWarmStarting";

/// Is constraint warm starting enabled?
World_IsWarmStartingEnabled :: (worldId: WorldId) -> bool #foreign box2d "b2World_IsWarmStartingEnabled";

/// Get the number of awake bodies.
World_GetAwakeBodyCount :: (worldId: WorldId) -> s32 #foreign box2d "b2World_GetAwakeBodyCount";

/// Get the current world performance profile
World_GetProfile :: (worldId: WorldId) -> Profile #foreign box2d "b2World_GetProfile";

/// Get world counters and sizes
World_GetCounters :: (worldId: WorldId) -> Counters #foreign box2d "b2World_GetCounters";

/// Set the user data pointer.
World_SetUserData :: (worldId: WorldId, userData: *void) -> void #foreign box2d "b2World_SetUserData";

/// Get the user data pointer.
World_GetUserData :: (worldId: WorldId) -> *void #foreign box2d "b2World_GetUserData";

/// Set the friction callback. Passing NULL resets to default.
World_SetFrictionCallback :: (worldId: WorldId, callback: FrictionCallback) -> void #foreign box2d "b2World_SetFrictionCallback";

/// Set the restitution callback. Passing NULL resets to default.
World_SetRestitutionCallback :: (worldId: WorldId, callback: RestitutionCallback) -> void #foreign box2d "b2World_SetRestitutionCallback";

/// Dump memory stats to box2d_memory.txt
World_DumpMemoryStats :: (worldId: WorldId) -> void #foreign box2d "b2World_DumpMemoryStats";

/// This is for internal testing
World_RebuildStaticTree :: (worldId: WorldId) -> void #foreign box2d "b2World_RebuildStaticTree";

/// This is for internal testing
World_EnableSpeculative :: (worldId: WorldId, flag: bool) -> void #foreign box2d "b2World_EnableSpeculative";

/// Create a rigid body given a definition. No reference to the definition is retained. So you can create the definition
/// on the stack and pass it as a pointer.
/// @code{.c}
/// b2BodyDef bodyDef = b2DefaultBodyDef();
/// b2BodyId myBodyId = b2CreateBody(myWorldId, &bodyDef);
/// @endcode
/// @warning This function is locked during callbacks.
CreateBody :: (worldId: WorldId, def: *BodyDef) -> BodyId #foreign box2d "b2CreateBody";

/// Destroy a rigid body given an id. This destroys all shapes and joints attached to the body.
/// Do not keep references to the associated shapes and joints.
DestroyBody :: (bodyId: BodyId) -> void #foreign box2d "b2DestroyBody";

/// Body identifier validation. Can be used to detect orphaned ids. Provides validation for up to 64K allocations.
Body_IsValid :: (id: BodyId) -> bool #foreign box2d "b2Body_IsValid";

/// Get the body type: static, kinematic, or dynamic
Body_GetType :: (bodyId: BodyId) -> BodyType #foreign box2d "b2Body_GetType";

/// Change the body type. This is an expensive operation. This automatically updates the mass
/// properties regardless of the automatic mass setting.
Body_SetType :: (bodyId: BodyId, type: BodyType) -> void #foreign box2d "b2Body_SetType";

/// Set the body name. Up to 31 characters excluding 0 termination.
Body_SetName :: (bodyId: BodyId, name: *u8) -> void #foreign box2d "b2Body_SetName";

/// Get the body name. May be null.
Body_GetName :: (bodyId: BodyId) -> *u8 #foreign box2d "b2Body_GetName";

/// Set the user data for a body
Body_SetUserData :: (bodyId: BodyId, userData: *void) -> void #foreign box2d "b2Body_SetUserData";

/// Get the user data stored in a body
Body_GetUserData :: (bodyId: BodyId) -> *void #foreign box2d "b2Body_GetUserData";

/// Get the world position of a body. This is the location of the body origin.
Body_GetPosition :: (bodyId: BodyId) -> Vec2 #foreign box2d "b2Body_GetPosition";

/// Get the world rotation of a body as a cosine/sine pair (complex number)
Body_GetRotation :: (bodyId: BodyId) -> Rot #foreign box2d "b2Body_GetRotation";

/// Get the world transform of a body.
Body_GetTransform :: (bodyId: BodyId) -> Transform #foreign box2d "b2Body_GetTransform";

/// Set the world transform of a body. This acts as a teleport and is fairly expensive.
/// @note Generally you should create a body with then intended transform.
/// @see b2BodyDef::position and b2BodyDef::angle
Body_SetTransform :: (bodyId: BodyId, position: Vec2, rotation: Rot) -> void #foreign box2d "b2Body_SetTransform";

/// Get a local point on a body given a world point
Body_GetLocalPoint :: (bodyId: BodyId, worldPoint: Vec2) -> Vec2 #foreign box2d "b2Body_GetLocalPoint";

/// Get a world point on a body given a local point
Body_GetWorldPoint :: (bodyId: BodyId, localPoint: Vec2) -> Vec2 #foreign box2d "b2Body_GetWorldPoint";

/// Get a local vector on a body given a world vector
Body_GetLocalVector :: (bodyId: BodyId, worldVector: Vec2) -> Vec2 #foreign box2d "b2Body_GetLocalVector";

/// Get a world vector on a body given a local vector
Body_GetWorldVector :: (bodyId: BodyId, localVector: Vec2) -> Vec2 #foreign box2d "b2Body_GetWorldVector";

/// Get the linear velocity of a body's center of mass. Usually in meters per second.
Body_GetLinearVelocity :: (bodyId: BodyId) -> Vec2 #foreign box2d "b2Body_GetLinearVelocity";

/// Get the angular velocity of a body in radians per second
Body_GetAngularVelocity :: (bodyId: BodyId) -> float #foreign box2d "b2Body_GetAngularVelocity";

/// Set the linear velocity of a body. Usually in meters per second.
Body_SetLinearVelocity :: (bodyId: BodyId, linearVelocity: Vec2) -> void #foreign box2d "b2Body_SetLinearVelocity";

/// Set the angular velocity of a body in radians per second
Body_SetAngularVelocity :: (bodyId: BodyId, angularVelocity: float) -> void #foreign box2d "b2Body_SetAngularVelocity";

/// Set the velocity to reach the given transform after a given time step.
/// The result will be close but maybe not exact. This is meant for kinematic bodies.
/// The target is not applied if the velocity would be below the sleep threshold.
/// This will automatically wake the body if asleep.
Body_SetTargetTransform :: (bodyId: BodyId, target: Transform, timeStep: float) -> void #foreign box2d "b2Body_SetTargetTransform";

/// Get the linear velocity of a local point attached to a body. Usually in meters per second.
Body_GetLocalPointVelocity :: (bodyId: BodyId, localPoint: Vec2) -> Vec2 #foreign box2d "b2Body_GetLocalPointVelocity";

/// Get the linear velocity of a world point attached to a body. Usually in meters per second.
Body_GetWorldPointVelocity :: (bodyId: BodyId, worldPoint: Vec2) -> Vec2 #foreign box2d "b2Body_GetWorldPointVelocity";

/// Apply a force at a world point. If the force is not applied at the center of mass,
/// it will generate a torque and affect the angular velocity. This optionally wakes up the body.
/// The force is ignored if the body is not awake.
/// @param bodyId The body id
/// @param force The world force vector, usually in newtons (N)
/// @param point The world position of the point of application
/// @param wake Option to wake up the body
Body_ApplyForce :: (bodyId: BodyId, force: Vec2, point: Vec2, wake: bool) -> void #foreign box2d "b2Body_ApplyForce";

/// Apply a force to the center of mass. This optionally wakes up the body.
/// The force is ignored if the body is not awake.
/// @param bodyId The body id
/// @param force the world force vector, usually in newtons (N).
/// @param wake also wake up the body
Body_ApplyForceToCenter :: (bodyId: BodyId, force: Vec2, wake: bool) -> void #foreign box2d "b2Body_ApplyForceToCenter";

/// Apply a torque. This affects the angular velocity without affecting the linear velocity.
/// This optionally wakes the body. The torque is ignored if the body is not awake.
/// @param bodyId The body id
/// @param torque about the z-axis (out of the screen), usually in N*m.
/// @param wake also wake up the body
Body_ApplyTorque :: (bodyId: BodyId, torque: float, wake: bool) -> void #foreign box2d "b2Body_ApplyTorque";

/// Apply an impulse at a point. This immediately modifies the velocity.
/// It also modifies the angular velocity if the point of application
/// is not at the center of mass. This optionally wakes the body.
/// The impulse is ignored if the body is not awake.
/// @param bodyId The body id
/// @param impulse the world impulse vector, usually in N*s or kg*m/s.
/// @param point the world position of the point of application.
/// @param wake also wake up the body
/// @warning This should be used for one-shot impulses. If you need a steady force,
/// use a force instead, which will work better with the sub-stepping solver.
Body_ApplyLinearImpulse :: (bodyId: BodyId, impulse: Vec2, point: Vec2, wake: bool) -> void #foreign box2d "b2Body_ApplyLinearImpulse";

/// Apply an impulse to the center of mass. This immediately modifies the velocity.
/// The impulse is ignored if the body is not awake. This optionally wakes the body.
/// @param bodyId The body id
/// @param impulse the world impulse vector, usually in N*s or kg*m/s.
/// @param wake also wake up the body
/// @warning This should be used for one-shot impulses. If you need a steady force,
/// use a force instead, which will work better with the sub-stepping solver.
Body_ApplyLinearImpulseToCenter :: (bodyId: BodyId, impulse: Vec2, wake: bool) -> void #foreign box2d "b2Body_ApplyLinearImpulseToCenter";

/// Apply an angular impulse. The impulse is ignored if the body is not awake.
/// This optionally wakes the body.
/// @param bodyId The body id
/// @param impulse the angular impulse, usually in units of kg*m*m/s
/// @param wake also wake up the body
/// @warning This should be used for one-shot impulses. If you need a steady force,
/// use a force instead, which will work better with the sub-stepping solver.
Body_ApplyAngularImpulse :: (bodyId: BodyId, impulse: float, wake: bool) -> void #foreign box2d "b2Body_ApplyAngularImpulse";

/// Get the mass of the body, usually in kilograms
Body_GetMass :: (bodyId: BodyId) -> float #foreign box2d "b2Body_GetMass";

/// Get the rotational inertia of the body, usually in kg*m^2
Body_GetRotationalInertia :: (bodyId: BodyId) -> float #foreign box2d "b2Body_GetRotationalInertia";

/// Get the center of mass position of the body in local space
Body_GetLocalCenterOfMass :: (bodyId: BodyId) -> Vec2 #foreign box2d "b2Body_GetLocalCenterOfMass";

/// Get the center of mass position of the body in world space
Body_GetWorldCenterOfMass :: (bodyId: BodyId) -> Vec2 #foreign box2d "b2Body_GetWorldCenterOfMass";

/// Override the body's mass properties. Normally this is computed automatically using the
/// shape geometry and density. This information is lost if a shape is added or removed or if the
/// body type changes.
Body_SetMassData :: (bodyId: BodyId, massData: MassData) -> void #foreign box2d "b2Body_SetMassData";

/// Get the mass data for a body
Body_GetMassData :: (bodyId: BodyId) -> MassData #foreign box2d "b2Body_GetMassData";

/// This update the mass properties to the sum of the mass properties of the shapes.
/// This normally does not need to be called unless you called SetMassData to override
/// the mass and you later want to reset the mass.
/// You may also use this when automatic mass computation has been disabled.
/// You should call this regardless of body type.
/// Note that sensor shapes may have mass.
Body_ApplyMassFromShapes :: (bodyId: BodyId) -> void #foreign box2d "b2Body_ApplyMassFromShapes";

/// Adjust the linear damping. Normally this is set in b2BodyDef before creation.
Body_SetLinearDamping :: (bodyId: BodyId, linearDamping: float) -> void #foreign box2d "b2Body_SetLinearDamping";

/// Get the current linear damping.
Body_GetLinearDamping :: (bodyId: BodyId) -> float #foreign box2d "b2Body_GetLinearDamping";

/// Adjust the angular damping. Normally this is set in b2BodyDef before creation.
Body_SetAngularDamping :: (bodyId: BodyId, angularDamping: float) -> void #foreign box2d "b2Body_SetAngularDamping";

/// Get the current angular damping.
Body_GetAngularDamping :: (bodyId: BodyId) -> float #foreign box2d "b2Body_GetAngularDamping";

/// Adjust the gravity scale. Normally this is set in b2BodyDef before creation.
/// @see b2BodyDef::gravityScale
Body_SetGravityScale :: (bodyId: BodyId, gravityScale: float) -> void #foreign box2d "b2Body_SetGravityScale";

/// Get the current gravity scale
Body_GetGravityScale :: (bodyId: BodyId) -> float #foreign box2d "b2Body_GetGravityScale";

/// @return true if this body is awake
Body_IsAwake :: (bodyId: BodyId) -> bool #foreign box2d "b2Body_IsAwake";

/// Wake a body from sleep. This wakes the entire island the body is touching.
/// @warning Putting a body to sleep will put the entire island of bodies touching this body to sleep,
/// which can be expensive and possibly unintuitive.
Body_SetAwake :: (bodyId: BodyId, awake: bool) -> void #foreign box2d "b2Body_SetAwake";

/// Enable or disable sleeping for this body. If sleeping is disabled the body will wake.
Body_EnableSleep :: (bodyId: BodyId, enableSleep: bool) -> void #foreign box2d "b2Body_EnableSleep";

/// Returns true if sleeping is enabled for this body
Body_IsSleepEnabled :: (bodyId: BodyId) -> bool #foreign box2d "b2Body_IsSleepEnabled";

/// Set the sleep threshold, usually in meters per second
Body_SetSleepThreshold :: (bodyId: BodyId, sleepThreshold: float) -> void #foreign box2d "b2Body_SetSleepThreshold";

/// Get the sleep threshold, usually in meters per second.
Body_GetSleepThreshold :: (bodyId: BodyId) -> float #foreign box2d "b2Body_GetSleepThreshold";

/// Returns true if this body is enabled
Body_IsEnabled :: (bodyId: BodyId) -> bool #foreign box2d "b2Body_IsEnabled";

/// Disable a body by removing it completely from the simulation. This is expensive.
Body_Disable :: (bodyId: BodyId) -> void #foreign box2d "b2Body_Disable";

/// Enable a body by adding it to the simulation. This is expensive.
Body_Enable :: (bodyId: BodyId) -> void #foreign box2d "b2Body_Enable";

/// Set this body to have fixed rotation. This causes the mass to be reset in all cases.
Body_SetFixedRotation :: (bodyId: BodyId, flag: bool) -> void #foreign box2d "b2Body_SetFixedRotation";

/// Does this body have fixed rotation?
Body_IsFixedRotation :: (bodyId: BodyId) -> bool #foreign box2d "b2Body_IsFixedRotation";

/// Set this body to be a bullet. A bullet does continuous collision detection
/// against dynamic bodies (but not other bullets).
Body_SetBullet :: (bodyId: BodyId, flag: bool) -> void #foreign box2d "b2Body_SetBullet";

/// Is this body a bullet?
Body_IsBullet :: (bodyId: BodyId) -> bool #foreign box2d "b2Body_IsBullet";

/// Enable/disable contact events on all shapes.
/// @see b2ShapeDef::enableContactEvents
/// @warning changing this at runtime may cause mismatched begin/end touch events
Body_EnableContactEvents :: (bodyId: BodyId, flag: bool) -> void #foreign box2d "b2Body_EnableContactEvents";

/// Enable/disable hit events on all shapes
/// @see b2ShapeDef::enableHitEvents
Body_EnableHitEvents :: (bodyId: BodyId, flag: bool) -> void #foreign box2d "b2Body_EnableHitEvents";

/// Get the world that owns this body
Body_GetWorld :: (bodyId: BodyId) -> WorldId #foreign box2d "b2Body_GetWorld";

/// Get the number of shapes on this body
Body_GetShapeCount :: (bodyId: BodyId) -> s32 #foreign box2d "b2Body_GetShapeCount";

/// Get the shape ids for all shapes on this body, up to the provided capacity.
/// @returns the number of shape ids stored in the user array
Body_GetShapes :: (bodyId: BodyId, shapeArray: *ShapeId, capacity: s32) -> s32 #foreign box2d "b2Body_GetShapes";

/// Get the number of joints on this body
Body_GetJointCount :: (bodyId: BodyId) -> s32 #foreign box2d "b2Body_GetJointCount";

/// Get the joint ids for all joints on this body, up to the provided capacity
/// @returns the number of joint ids stored in the user array
Body_GetJoints :: (bodyId: BodyId, jointArray: *JointId, capacity: s32) -> s32 #foreign box2d "b2Body_GetJoints";

/// Get the maximum capacity required for retrieving all the touching contacts on a body
Body_GetContactCapacity :: (bodyId: BodyId) -> s32 #foreign box2d "b2Body_GetContactCapacity";

/// Get the touching contact data for a body.
/// @note Box2D uses speculative collision so some contact points may be separated.
/// @returns the number of elements filled in the provided array
/// @warning do not ignore the return value, it specifies the valid number of elements
Body_GetContactData :: (bodyId: BodyId, contactData: *ContactData, capacity: s32) -> s32 #foreign box2d "b2Body_GetContactData";

/// Get the current world AABB that contains all the attached shapes. Note that this may not encompass the body origin.
/// If there are no shapes attached then the returned AABB is empty and centered on the body origin.
Body_ComputeAABB :: (bodyId: BodyId) -> AABB #foreign box2d "b2Body_ComputeAABB";

/// Create a circle shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
/// @return the shape id for accessing the shape
CreateCircleShape :: (bodyId: BodyId, def: *ShapeDef, circle: *Circle) -> ShapeId #foreign box2d "b2CreateCircleShape";

/// Create a line segment shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
/// @return the shape id for accessing the shape
CreateSegmentShape :: (bodyId: BodyId, def: *ShapeDef, segment: *Segment) -> ShapeId #foreign box2d "b2CreateSegmentShape";

/// Create a capsule shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
/// @return the shape id for accessing the shape
CreateCapsuleShape :: (bodyId: BodyId, def: *ShapeDef, capsule: *Capsule) -> ShapeId #foreign box2d "b2CreateCapsuleShape";

/// Create a polygon shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
/// @return the shape id for accessing the shape
CreatePolygonShape :: (bodyId: BodyId, def: *ShapeDef, polygon: *Polygon) -> ShapeId #foreign box2d "b2CreatePolygonShape";

/// Destroy a shape. You may defer the body mass update which can improve performance if several shapes on a
///	body are destroyed at once.
///	@see b2Body_ApplyMassFromShapes
DestroyShape :: (shapeId: ShapeId, updateBodyMass: bool) -> void #foreign box2d "b2DestroyShape";

/// Shape identifier validation. Provides validation for up to 64K allocations.
Shape_IsValid :: (id: ShapeId) -> bool #foreign box2d "b2Shape_IsValid";

/// Get the type of a shape
Shape_GetType :: (shapeId: ShapeId) -> ShapeType #foreign box2d "b2Shape_GetType";

/// Get the id of the body that a shape is attached to
Shape_GetBody :: (shapeId: ShapeId) -> BodyId #foreign box2d "b2Shape_GetBody";

/// Get the world that owns this shape
Shape_GetWorld :: (shapeId: ShapeId) -> WorldId #foreign box2d "b2Shape_GetWorld";

/// Returns true if the shape is a sensor. It is not possible to change a shape
/// from sensor to solid dynamically because this breaks the contract for
/// sensor events.
Shape_IsSensor :: (shapeId: ShapeId) -> bool #foreign box2d "b2Shape_IsSensor";

/// Set the user data for a shape
Shape_SetUserData :: (shapeId: ShapeId, userData: *void) -> void #foreign box2d "b2Shape_SetUserData";

/// Get the user data for a shape. This is useful when you get a shape id
/// from an event or query.
Shape_GetUserData :: (shapeId: ShapeId) -> *void #foreign box2d "b2Shape_GetUserData";

/// Set the mass density of a shape, usually in kg/m^2.
/// This will optionally update the mass properties on the parent body.
/// @see b2ShapeDef::density, b2Body_ApplyMassFromShapes
Shape_SetDensity :: (shapeId: ShapeId, density: float, updateBodyMass: bool) -> void #foreign box2d "b2Shape_SetDensity";

/// Get the density of a shape, usually in kg/m^2
Shape_GetDensity :: (shapeId: ShapeId) -> float #foreign box2d "b2Shape_GetDensity";

/// Set the friction on a shape
/// @see b2ShapeDef::friction
Shape_SetFriction :: (shapeId: ShapeId, friction: float) -> void #foreign box2d "b2Shape_SetFriction";

/// Get the friction of a shape
Shape_GetFriction :: (shapeId: ShapeId) -> float #foreign box2d "b2Shape_GetFriction";

/// Set the shape restitution (bounciness)
/// @see b2ShapeDef::restitution
Shape_SetRestitution :: (shapeId: ShapeId, restitution: float) -> void #foreign box2d "b2Shape_SetRestitution";

/// Get the shape restitution
Shape_GetRestitution :: (shapeId: ShapeId) -> float #foreign box2d "b2Shape_GetRestitution";

/// Set the shape material identifier
/// @see b2ShapeDef::material
Shape_SetMaterial :: (shapeId: ShapeId, material: s32) -> void #foreign box2d "b2Shape_SetMaterial";

/// Get the shape material identifier
Shape_GetMaterial :: (shapeId: ShapeId) -> s32 #foreign box2d "b2Shape_GetMaterial";

/// Set the shape surface material
Shape_SetSurfaceMaterial :: (shapeId: ShapeId, surfaceMaterial: SurfaceMaterial) -> void #foreign box2d "b2Shape_SetSurfaceMaterial";

/// Get the shape surface material
Shape_GetSurfaceMaterial :: (shapeId: ShapeId) -> SurfaceMaterial #foreign box2d "b2Shape_GetSurfaceMaterial";

/// Get the shape filter
Shape_GetFilter :: (shapeId: ShapeId) -> Filter #foreign box2d "b2Shape_GetFilter";

/// Set the current filter. This is almost as expensive as recreating the shape. This may cause
/// contacts to be immediately destroyed. However contacts are not created until the next world step.
/// Sensor overlap state is also not updated until the next world step.
/// @see b2ShapeDef::filter
Shape_SetFilter :: (shapeId: ShapeId, filter: Filter) -> void #foreign box2d "b2Shape_SetFilter";

/// Enable sensor events for this shape.
/// @see b2ShapeDef::enableSensorEvents
Shape_EnableSensorEvents :: (shapeId: ShapeId, flag: bool) -> void #foreign box2d "b2Shape_EnableSensorEvents";

/// Returns true if sensor events are enabled.
Shape_AreSensorEventsEnabled :: (shapeId: ShapeId) -> bool #foreign box2d "b2Shape_AreSensorEventsEnabled";

/// Enable contact events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors.
/// @see b2ShapeDef::enableContactEvents
/// @warning changing this at run-time may lead to lost begin/end events
Shape_EnableContactEvents :: (shapeId: ShapeId, flag: bool) -> void #foreign box2d "b2Shape_EnableContactEvents";

/// Returns true if contact events are enabled
Shape_AreContactEventsEnabled :: (shapeId: ShapeId) -> bool #foreign box2d "b2Shape_AreContactEventsEnabled";

/// Enable pre-solve contact events for this shape. Only applies to dynamic bodies. These are expensive
/// and must be carefully handled due to multithreading. Ignored for sensors.
/// @see b2PreSolveFcn
Shape_EnablePreSolveEvents :: (shapeId: ShapeId, flag: bool) -> void #foreign box2d "b2Shape_EnablePreSolveEvents";

/// Returns true if pre-solve events are enabled
Shape_ArePreSolveEventsEnabled :: (shapeId: ShapeId) -> bool #foreign box2d "b2Shape_ArePreSolveEventsEnabled";

/// Enable contact hit events for this shape. Ignored for sensors.
/// @see b2WorldDef.hitEventThreshold
Shape_EnableHitEvents :: (shapeId: ShapeId, flag: bool) -> void #foreign box2d "b2Shape_EnableHitEvents";

/// Returns true if hit events are enabled
Shape_AreHitEventsEnabled :: (shapeId: ShapeId) -> bool #foreign box2d "b2Shape_AreHitEventsEnabled";

/// Test a point for overlap with a shape
Shape_TestPoint :: (shapeId: ShapeId, point: Vec2) -> bool #foreign box2d "b2Shape_TestPoint";

/// Ray cast a shape directly
Shape_RayCast :: (shapeId: ShapeId, input: *RayCastInput) -> CastOutput #foreign box2d "b2Shape_RayCast";

/// Get a copy of the shape's circle. Asserts the type is correct.
Shape_GetCircle :: (shapeId: ShapeId) -> Circle #foreign box2d "b2Shape_GetCircle";

/// Get a copy of the shape's line segment. Asserts the type is correct.
Shape_GetSegment :: (shapeId: ShapeId) -> Segment #foreign box2d "b2Shape_GetSegment";

/// Get a copy of the shape's chain segment. These come from chain shapes.
/// Asserts the type is correct.
Shape_GetChainSegment :: (shapeId: ShapeId) -> ChainSegment #foreign box2d "b2Shape_GetChainSegment";

/// Get a copy of the shape's capsule. Asserts the type is correct.
Shape_GetCapsule :: (shapeId: ShapeId) -> Capsule #foreign box2d "b2Shape_GetCapsule";

/// Get a copy of the shape's convex polygon. Asserts the type is correct.
Shape_GetPolygon :: (shapeId: ShapeId) -> Polygon #foreign box2d "b2Shape_GetPolygon";

/// Allows you to change a shape to be a circle or update the current circle.
/// This does not modify the mass properties.
/// @see b2Body_ApplyMassFromShapes
Shape_SetCircle :: (shapeId: ShapeId, circle: *Circle) -> void #foreign box2d "b2Shape_SetCircle";

/// Allows you to change a shape to be a capsule or update the current capsule.
/// This does not modify the mass properties.
/// @see b2Body_ApplyMassFromShapes
Shape_SetCapsule :: (shapeId: ShapeId, capsule: *Capsule) -> void #foreign box2d "b2Shape_SetCapsule";

/// Allows you to change a shape to be a segment or update the current segment.
Shape_SetSegment :: (shapeId: ShapeId, segment: *Segment) -> void #foreign box2d "b2Shape_SetSegment";

/// Allows you to change a shape to be a polygon or update the current polygon.
/// This does not modify the mass properties.
/// @see b2Body_ApplyMassFromShapes
Shape_SetPolygon :: (shapeId: ShapeId, polygon: *Polygon) -> void #foreign box2d "b2Shape_SetPolygon";

/// Get the parent chain id if the shape type is a chain segment, otherwise
/// returns b2_nullChainId.
Shape_GetParentChain :: (shapeId: ShapeId) -> ChainId #foreign box2d "b2Shape_GetParentChain";

/// Get the maximum capacity required for retrieving all the touching contacts on a shape
Shape_GetContactCapacity :: (shapeId: ShapeId) -> s32 #foreign box2d "b2Shape_GetContactCapacity";

/// Get the touching contact data for a shape. The provided shapeId will be either shapeIdA or shapeIdB on the contact data.
/// @note Box2D uses speculative collision so some contact points may be separated.
/// @returns the number of elements filled in the provided array
/// @warning do not ignore the return value, it specifies the valid number of elements
Shape_GetContactData :: (shapeId: ShapeId, contactData: *ContactData, capacity: s32) -> s32 #foreign box2d "b2Shape_GetContactData";

/// Get the maximum capacity required for retrieving all the overlapped shapes on a sensor shape.
/// This returns 0 if the provided shape is not a sensor.
/// @param shapeId the id of a sensor shape
/// @returns the required capacity to get all the overlaps in b2Shape_GetSensorOverlaps
Shape_GetSensorCapacity :: (shapeId: ShapeId) -> s32 #foreign box2d "b2Shape_GetSensorCapacity";

/// Get the overlapped shapes for a sensor shape.
/// @param shapeId the id of a sensor shape
/// @param overlaps a user allocated array that is filled with the overlapping shapes
/// @param capacity the capacity of overlappedShapes
/// @returns the number of elements filled in the provided array
/// @warning do not ignore the return value, it specifies the valid number of elements
/// @warning overlaps may contain destroyed shapes so use b2Shape_IsValid to confirm each overlap
Shape_GetSensorOverlaps :: (shapeId: ShapeId, overlaps: *ShapeId, capacity: s32) -> s32 #foreign box2d "b2Shape_GetSensorOverlaps";

/// Get the current world AABB
Shape_GetAABB :: (shapeId: ShapeId) -> AABB #foreign box2d "b2Shape_GetAABB";

/// Get the mass data for a shape
Shape_GetMassData :: (shapeId: ShapeId) -> MassData #foreign box2d "b2Shape_GetMassData";

/// Get the closest point on a shape to a target point. Target and result are in world space.
/// todo need sample
Shape_GetClosestPoint :: (shapeId: ShapeId, target: Vec2) -> Vec2 #foreign box2d "b2Shape_GetClosestPoint";

/// Create a chain shape
/// @see b2ChainDef for details
CreateChain :: (bodyId: BodyId, def: *ChainDef) -> ChainId #foreign box2d "b2CreateChain";

/// Destroy a chain shape
DestroyChain :: (chainId: ChainId) -> void #foreign box2d "b2DestroyChain";

/// Get the world that owns this chain shape
Chain_GetWorld :: (chainId: ChainId) -> WorldId #foreign box2d "b2Chain_GetWorld";

/// Get the number of segments on this chain
Chain_GetSegmentCount :: (chainId: ChainId) -> s32 #foreign box2d "b2Chain_GetSegmentCount";

/// Fill a user array with chain segment shape ids up to the specified capacity. Returns
/// the actual number of segments returned.
Chain_GetSegments :: (chainId: ChainId, segmentArray: *ShapeId, capacity: s32) -> s32 #foreign box2d "b2Chain_GetSegments";

/// Set the chain friction
/// @see b2ChainDef::friction
Chain_SetFriction :: (chainId: ChainId, friction: float) -> void #foreign box2d "b2Chain_SetFriction";

/// Get the chain friction
Chain_GetFriction :: (chainId: ChainId) -> float #foreign box2d "b2Chain_GetFriction";

/// Set the chain restitution (bounciness)
/// @see b2ChainDef::restitution
Chain_SetRestitution :: (chainId: ChainId, restitution: float) -> void #foreign box2d "b2Chain_SetRestitution";

/// Get the chain restitution
Chain_GetRestitution :: (chainId: ChainId) -> float #foreign box2d "b2Chain_GetRestitution";

/// Set the chain material
/// @see b2ChainDef::material
Chain_SetMaterial :: (chainId: ChainId, material: s32) -> void #foreign box2d "b2Chain_SetMaterial";

/// Get the chain material
Chain_GetMaterial :: (chainId: ChainId) -> s32 #foreign box2d "b2Chain_GetMaterial";

/// Chain identifier validation. Provides validation for up to 64K allocations.
Chain_IsValid :: (id: ChainId) -> bool #foreign box2d "b2Chain_IsValid";

/// Destroy a joint
DestroyJoint :: (jointId: JointId) -> void #foreign box2d "b2DestroyJoint";

/// Joint identifier validation. Provides validation for up to 64K allocations.
Joint_IsValid :: (id: JointId) -> bool #foreign box2d "b2Joint_IsValid";

/// Get the joint type
Joint_GetType :: (jointId: JointId) -> JointType #foreign box2d "b2Joint_GetType";

/// Get body A id on a joint
Joint_GetBodyA :: (jointId: JointId) -> BodyId #foreign box2d "b2Joint_GetBodyA";

/// Get body B id on a joint
Joint_GetBodyB :: (jointId: JointId) -> BodyId #foreign box2d "b2Joint_GetBodyB";

/// Get the world that owns this joint
Joint_GetWorld :: (jointId: JointId) -> WorldId #foreign box2d "b2Joint_GetWorld";

/// Set the local anchor on bodyA
Joint_SetLocalAnchorA :: (jointId: JointId, localAnchor: Vec2) -> void #foreign box2d "b2Joint_SetLocalAnchorA";

/// Get the local anchor on bodyA
Joint_GetLocalAnchorA :: (jointId: JointId) -> Vec2 #foreign box2d "b2Joint_GetLocalAnchorA";

/// Set the local anchor on bodyB
Joint_SetLocalAnchorB :: (jointId: JointId, localAnchor: Vec2) -> void #foreign box2d "b2Joint_SetLocalAnchorB";

/// Get the local anchor on bodyB
Joint_GetLocalAnchorB :: (jointId: JointId) -> Vec2 #foreign box2d "b2Joint_GetLocalAnchorB";

/// Get the joint reference angle in radians (revolute, prismatic, and weld)
Joint_GetReferenceAngle :: (jointId: JointId) -> float #foreign box2d "b2Joint_GetReferenceAngle";

/// Set the joint reference angle in radians, must be in [-pi,pi]. (revolute, prismatic, and weld)
Joint_SetReferenceAngle :: (jointId: JointId, angleInRadians: float) -> void #foreign box2d "b2Joint_SetReferenceAngle";

/// Set the local axis on bodyA (prismatic and wheel)
Joint_SetLocalAxisA :: (jointId: JointId, localAxis: Vec2) -> void #foreign box2d "b2Joint_SetLocalAxisA";

/// Get the local axis on bodyA (prismatic and wheel)
Joint_GetLocalAxisA :: (jointId: JointId) -> Vec2 #foreign box2d "b2Joint_GetLocalAxisA";

/// Toggle collision between connected bodies
Joint_SetCollideConnected :: (jointId: JointId, shouldCollide: bool) -> void #foreign box2d "b2Joint_SetCollideConnected";

/// Is collision allowed between connected bodies?
Joint_GetCollideConnected :: (jointId: JointId) -> bool #foreign box2d "b2Joint_GetCollideConnected";

/// Set the user data on a joint
Joint_SetUserData :: (jointId: JointId, userData: *void) -> void #foreign box2d "b2Joint_SetUserData";

/// Get the user data on a joint
Joint_GetUserData :: (jointId: JointId) -> *void #foreign box2d "b2Joint_GetUserData";

/// Wake the bodies connect to this joint
Joint_WakeBodies :: (jointId: JointId) -> void #foreign box2d "b2Joint_WakeBodies";

/// Get the current constraint force for this joint. Usually in Newtons.
Joint_GetConstraintForce :: (jointId: JointId) -> Vec2 #foreign box2d "b2Joint_GetConstraintForce";

/// Get the current constraint torque for this joint. Usually in Newton * meters.
Joint_GetConstraintTorque :: (jointId: JointId) -> float #foreign box2d "b2Joint_GetConstraintTorque";

/// Get the current linear separation error for this joint. Does not consider admissible movement. Usually in meters.
Joint_GetLinearSeparation :: (jointId: JointId) -> float #foreign box2d "b2Joint_GetLinearSeparation";

/// Get the current angular separation error for this joint. Does not consider admissible movement. Usually in meters.
Joint_GetAngularSeparation :: (jointId: JointId) -> float #foreign box2d "b2Joint_GetAngularSeparation";

/// Get the joint constraint tuning. Advanced feature.
Joint_GetConstraintTuning :: (jointId: JointId, hertz: *float, dampingRatio: *float) -> void #foreign box2d "b2Joint_GetConstraintTuning";

/// Set the joint constraint tuning. Advanced feature.
/// @param jointId the joint
/// @param hertz the stiffness in Hertz (cycles per second)
/// @param dampingRatio the non-dimensional damping ratio (one for critical damping)
Joint_SetConstraintTuning :: (jointId: JointId, hertz: float, dampingRatio: float) -> void #foreign box2d "b2Joint_SetConstraintTuning";

/// Create a distance joint
/// @see b2DistanceJointDef for details
CreateDistanceJoint :: (worldId: WorldId, def: *DistanceJointDef) -> JointId #foreign box2d "b2CreateDistanceJoint";

/// Set the rest length of a distance joint
/// @param jointId The id for a distance joint
/// @param length The new distance joint length
DistanceJoint_SetLength :: (jointId: JointId, length: float) -> void #foreign box2d "b2DistanceJoint_SetLength";

/// Get the rest length of a distance joint
DistanceJoint_GetLength :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetLength";

/// Enable/disable the distance joint spring. When disabled the distance joint is rigid.
DistanceJoint_EnableSpring :: (jointId: JointId, enableSpring: bool) -> void #foreign box2d "b2DistanceJoint_EnableSpring";

/// Is the distance joint spring enabled?
DistanceJoint_IsSpringEnabled :: (jointId: JointId) -> bool #foreign box2d "b2DistanceJoint_IsSpringEnabled";

/// Set the spring stiffness in Hertz
DistanceJoint_SetSpringHertz :: (jointId: JointId, hertz: float) -> void #foreign box2d "b2DistanceJoint_SetSpringHertz";

/// Set the spring damping ratio, non-dimensional
DistanceJoint_SetSpringDampingRatio :: (jointId: JointId, dampingRatio: float) -> void #foreign box2d "b2DistanceJoint_SetSpringDampingRatio";

/// Get the spring Hertz
DistanceJoint_GetSpringHertz :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetSpringHertz";

/// Get the spring damping ratio
DistanceJoint_GetSpringDampingRatio :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetSpringDampingRatio";

/// Enable joint limit. The limit only works if the joint spring is enabled. Otherwise the joint is rigid
/// and the limit has no effect.
DistanceJoint_EnableLimit :: (jointId: JointId, enableLimit: bool) -> void #foreign box2d "b2DistanceJoint_EnableLimit";

/// Is the distance joint limit enabled?
DistanceJoint_IsLimitEnabled :: (jointId: JointId) -> bool #foreign box2d "b2DistanceJoint_IsLimitEnabled";

/// Set the minimum and maximum length parameters of a distance joint
DistanceJoint_SetLengthRange :: (jointId: JointId, minLength: float, maxLength: float) -> void #foreign box2d "b2DistanceJoint_SetLengthRange";

/// Get the distance joint minimum length
DistanceJoint_GetMinLength :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetMinLength";

/// Get the distance joint maximum length
DistanceJoint_GetMaxLength :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetMaxLength";

/// Get the current length of a distance joint
DistanceJoint_GetCurrentLength :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetCurrentLength";

/// Enable/disable the distance joint motor
DistanceJoint_EnableMotor :: (jointId: JointId, enableMotor: bool) -> void #foreign box2d "b2DistanceJoint_EnableMotor";

/// Is the distance joint motor enabled?
DistanceJoint_IsMotorEnabled :: (jointId: JointId) -> bool #foreign box2d "b2DistanceJoint_IsMotorEnabled";

/// Set the distance joint motor speed, usually in meters per second
DistanceJoint_SetMotorSpeed :: (jointId: JointId, motorSpeed: float) -> void #foreign box2d "b2DistanceJoint_SetMotorSpeed";

/// Get the distance joint motor speed, usually in meters per second
DistanceJoint_GetMotorSpeed :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetMotorSpeed";

/// Set the distance joint maximum motor force, usually in newtons
DistanceJoint_SetMaxMotorForce :: (jointId: JointId, force: float) -> void #foreign box2d "b2DistanceJoint_SetMaxMotorForce";

/// Get the distance joint maximum motor force, usually in newtons
DistanceJoint_GetMaxMotorForce :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetMaxMotorForce";

/// Get the distance joint current motor force, usually in newtons
DistanceJoint_GetMotorForce :: (jointId: JointId) -> float #foreign box2d "b2DistanceJoint_GetMotorForce";

/// Create a motor joint
/// @see b2MotorJointDef for details
CreateMotorJoint :: (worldId: WorldId, def: *MotorJointDef) -> JointId #foreign box2d "b2CreateMotorJoint";

/// Set the motor joint linear offset target
MotorJoint_SetLinearOffset :: (jointId: JointId, linearOffset: Vec2) -> void #foreign box2d "b2MotorJoint_SetLinearOffset";

/// Get the motor joint linear offset target
MotorJoint_GetLinearOffset :: (jointId: JointId) -> Vec2 #foreign box2d "b2MotorJoint_GetLinearOffset";

/// Set the motor joint angular offset target in radians. This angle will be unwound
/// so the motor will drive along the shortest arc.
MotorJoint_SetAngularOffset :: (jointId: JointId, angularOffset: float) -> void #foreign box2d "b2MotorJoint_SetAngularOffset";

/// Get the motor joint angular offset target in radians
MotorJoint_GetAngularOffset :: (jointId: JointId) -> float #foreign box2d "b2MotorJoint_GetAngularOffset";

/// Set the motor joint maximum force, usually in newtons
MotorJoint_SetMaxForce :: (jointId: JointId, maxForce: float) -> void #foreign box2d "b2MotorJoint_SetMaxForce";

/// Get the motor joint maximum force, usually in newtons
MotorJoint_GetMaxForce :: (jointId: JointId) -> float #foreign box2d "b2MotorJoint_GetMaxForce";

/// Set the motor joint maximum torque, usually in newton-meters
MotorJoint_SetMaxTorque :: (jointId: JointId, maxTorque: float) -> void #foreign box2d "b2MotorJoint_SetMaxTorque";

/// Get the motor joint maximum torque, usually in newton-meters
MotorJoint_GetMaxTorque :: (jointId: JointId) -> float #foreign box2d "b2MotorJoint_GetMaxTorque";

/// Set the motor joint correction factor, usually in [0, 1]
MotorJoint_SetCorrectionFactor :: (jointId: JointId, correctionFactor: float) -> void #foreign box2d "b2MotorJoint_SetCorrectionFactor";

/// Get the motor joint correction factor, usually in [0, 1]
MotorJoint_GetCorrectionFactor :: (jointId: JointId) -> float #foreign box2d "b2MotorJoint_GetCorrectionFactor";

/// Create a mouse joint
/// @see b2MouseJointDef for details
CreateMouseJoint :: (worldId: WorldId, def: *MouseJointDef) -> JointId #foreign box2d "b2CreateMouseJoint";

/// Set the mouse joint target
MouseJoint_SetTarget :: (jointId: JointId, target: Vec2) -> void #foreign box2d "b2MouseJoint_SetTarget";

/// Get the mouse joint target
MouseJoint_GetTarget :: (jointId: JointId) -> Vec2 #foreign box2d "b2MouseJoint_GetTarget";

/// Set the mouse joint spring stiffness in Hertz
MouseJoint_SetSpringHertz :: (jointId: JointId, hertz: float) -> void #foreign box2d "b2MouseJoint_SetSpringHertz";

/// Get the mouse joint spring stiffness in Hertz
MouseJoint_GetSpringHertz :: (jointId: JointId) -> float #foreign box2d "b2MouseJoint_GetSpringHertz";

/// Set the mouse joint spring damping ratio, non-dimensional
MouseJoint_SetSpringDampingRatio :: (jointId: JointId, dampingRatio: float) -> void #foreign box2d "b2MouseJoint_SetSpringDampingRatio";

/// Get the mouse joint damping ratio, non-dimensional
MouseJoint_GetSpringDampingRatio :: (jointId: JointId) -> float #foreign box2d "b2MouseJoint_GetSpringDampingRatio";

/// Set the mouse joint maximum force, usually in newtons
MouseJoint_SetMaxForce :: (jointId: JointId, maxForce: float) -> void #foreign box2d "b2MouseJoint_SetMaxForce";

/// Get the mouse joint maximum force, usually in newtons
MouseJoint_GetMaxForce :: (jointId: JointId) -> float #foreign box2d "b2MouseJoint_GetMaxForce";

/// Create a filter joint.
/// @see b2FilterJointDef for details
CreateFilterJoint :: (worldId: WorldId, def: *FilterJointDef) -> JointId #foreign box2d "b2CreateFilterJoint";

/// Create a prismatic (slider) joint.
/// @see b2PrismaticJointDef for details
CreatePrismaticJoint :: (worldId: WorldId, def: *PrismaticJointDef) -> JointId #foreign box2d "b2CreatePrismaticJoint";

/// Enable/disable the joint spring.
PrismaticJoint_EnableSpring :: (jointId: JointId, enableSpring: bool) -> void #foreign box2d "b2PrismaticJoint_EnableSpring";

/// Is the prismatic joint spring enabled or not?
PrismaticJoint_IsSpringEnabled :: (jointId: JointId) -> bool #foreign box2d "b2PrismaticJoint_IsSpringEnabled";

/// Set the prismatic joint stiffness in Hertz.
/// This should usually be less than a quarter of the simulation rate. For example, if the simulation
/// runs at 60Hz then the joint stiffness should be 15Hz or less.
PrismaticJoint_SetSpringHertz :: (jointId: JointId, hertz: float) -> void #foreign box2d "b2PrismaticJoint_SetSpringHertz";

/// Get the prismatic joint stiffness in Hertz
PrismaticJoint_GetSpringHertz :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetSpringHertz";

/// Set the prismatic joint damping ratio (non-dimensional)
PrismaticJoint_SetSpringDampingRatio :: (jointId: JointId, dampingRatio: float) -> void #foreign box2d "b2PrismaticJoint_SetSpringDampingRatio";

/// Get the prismatic spring damping ratio (non-dimensional)
PrismaticJoint_GetSpringDampingRatio :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetSpringDampingRatio";

/// Set the prismatic joint spring target angle, usually in meters
PrismaticJoint_SetTargetTranslation :: (jointId: JointId, translation: float) -> void #foreign box2d "b2PrismaticJoint_SetTargetTranslation";

/// Get the prismatic joint spring target translation, usually in meters
PrismaticJoint_GetTargetTranslation :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetTargetTranslation";

/// Enable/disable a prismatic joint limit
PrismaticJoint_EnableLimit :: (jointId: JointId, enableLimit: bool) -> void #foreign box2d "b2PrismaticJoint_EnableLimit";

/// Is the prismatic joint limit enabled?
PrismaticJoint_IsLimitEnabled :: (jointId: JointId) -> bool #foreign box2d "b2PrismaticJoint_IsLimitEnabled";

/// Get the prismatic joint lower limit
PrismaticJoint_GetLowerLimit :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetLowerLimit";

/// Get the prismatic joint upper limit
PrismaticJoint_GetUpperLimit :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetUpperLimit";

/// Set the prismatic joint limits
PrismaticJoint_SetLimits :: (jointId: JointId, lower: float, upper: float) -> void #foreign box2d "b2PrismaticJoint_SetLimits";

/// Enable/disable a prismatic joint motor
PrismaticJoint_EnableMotor :: (jointId: JointId, enableMotor: bool) -> void #foreign box2d "b2PrismaticJoint_EnableMotor";

/// Is the prismatic joint motor enabled?
PrismaticJoint_IsMotorEnabled :: (jointId: JointId) -> bool #foreign box2d "b2PrismaticJoint_IsMotorEnabled";

/// Set the prismatic joint motor speed, usually in meters per second
PrismaticJoint_SetMotorSpeed :: (jointId: JointId, motorSpeed: float) -> void #foreign box2d "b2PrismaticJoint_SetMotorSpeed";

/// Get the prismatic joint motor speed, usually in meters per second
PrismaticJoint_GetMotorSpeed :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetMotorSpeed";

/// Set the prismatic joint maximum motor force, usually in newtons
PrismaticJoint_SetMaxMotorForce :: (jointId: JointId, force: float) -> void #foreign box2d "b2PrismaticJoint_SetMaxMotorForce";

/// Get the prismatic joint maximum motor force, usually in newtons
PrismaticJoint_GetMaxMotorForce :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetMaxMotorForce";

/// Get the prismatic joint current motor force, usually in newtons
PrismaticJoint_GetMotorForce :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetMotorForce";

/// Get the current joint translation, usually in meters.
PrismaticJoint_GetTranslation :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetTranslation";

/// Get the current joint translation speed, usually in meters per second.
PrismaticJoint_GetSpeed :: (jointId: JointId) -> float #foreign box2d "b2PrismaticJoint_GetSpeed";

/// Create a revolute joint
/// @see b2RevoluteJointDef for details
CreateRevoluteJoint :: (worldId: WorldId, def: *RevoluteJointDef) -> JointId #foreign box2d "b2CreateRevoluteJoint";

/// Enable/disable the revolute joint spring
RevoluteJoint_EnableSpring :: (jointId: JointId, enableSpring: bool) -> void #foreign box2d "b2RevoluteJoint_EnableSpring";

/// It the revolute angular spring enabled?
RevoluteJoint_IsSpringEnabled :: (jointId: JointId) -> bool #foreign box2d "b2RevoluteJoint_IsSpringEnabled";

/// Set the revolute joint spring stiffness in Hertz
RevoluteJoint_SetSpringHertz :: (jointId: JointId, hertz: float) -> void #foreign box2d "b2RevoluteJoint_SetSpringHertz";

/// Get the revolute joint spring stiffness in Hertz
RevoluteJoint_GetSpringHertz :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetSpringHertz";

/// Set the revolute joint spring damping ratio, non-dimensional
RevoluteJoint_SetSpringDampingRatio :: (jointId: JointId, dampingRatio: float) -> void #foreign box2d "b2RevoluteJoint_SetSpringDampingRatio";

/// Get the revolute joint spring damping ratio, non-dimensional
RevoluteJoint_GetSpringDampingRatio :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetSpringDampingRatio";

/// Set the revolute joint spring target angle, radians
RevoluteJoint_SetTargetAngle :: (jointId: JointId, angle: float) -> void #foreign box2d "b2RevoluteJoint_SetTargetAngle";

/// Get the revolute joint spring target angle, radians
RevoluteJoint_GetTargetAngle :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetTargetAngle";

/// Get the revolute joint current angle in radians relative to the reference angle
/// @see b2RevoluteJointDef::referenceAngle
RevoluteJoint_GetAngle :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetAngle";

/// Enable/disable the revolute joint limit
RevoluteJoint_EnableLimit :: (jointId: JointId, enableLimit: bool) -> void #foreign box2d "b2RevoluteJoint_EnableLimit";

/// Is the revolute joint limit enabled?
RevoluteJoint_IsLimitEnabled :: (jointId: JointId) -> bool #foreign box2d "b2RevoluteJoint_IsLimitEnabled";

/// Get the revolute joint lower limit in radians
RevoluteJoint_GetLowerLimit :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetLowerLimit";

/// Get the revolute joint upper limit in radians
RevoluteJoint_GetUpperLimit :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetUpperLimit";

/// Set the revolute joint limits in radians. It is expected that lower <= upper
/// and that -0.99 * B2_PI <= lower && upper <= -0.99 * B2_PI.
RevoluteJoint_SetLimits :: (jointId: JointId, lower: float, upper: float) -> void #foreign box2d "b2RevoluteJoint_SetLimits";

/// Enable/disable a revolute joint motor
RevoluteJoint_EnableMotor :: (jointId: JointId, enableMotor: bool) -> void #foreign box2d "b2RevoluteJoint_EnableMotor";

/// Is the revolute joint motor enabled?
RevoluteJoint_IsMotorEnabled :: (jointId: JointId) -> bool #foreign box2d "b2RevoluteJoint_IsMotorEnabled";

/// Set the revolute joint motor speed in radians per second
RevoluteJoint_SetMotorSpeed :: (jointId: JointId, motorSpeed: float) -> void #foreign box2d "b2RevoluteJoint_SetMotorSpeed";

/// Get the revolute joint motor speed in radians per second
RevoluteJoint_GetMotorSpeed :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetMotorSpeed";

/// Get the revolute joint current motor torque, usually in newton-meters
RevoluteJoint_GetMotorTorque :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetMotorTorque";

/// Set the revolute joint maximum motor torque, usually in newton-meters
RevoluteJoint_SetMaxMotorTorque :: (jointId: JointId, torque: float) -> void #foreign box2d "b2RevoluteJoint_SetMaxMotorTorque";

/// Get the revolute joint maximum motor torque, usually in newton-meters
RevoluteJoint_GetMaxMotorTorque :: (jointId: JointId) -> float #foreign box2d "b2RevoluteJoint_GetMaxMotorTorque";

/// Create a weld joint
/// @see b2WeldJointDef for details
CreateWeldJoint :: (worldId: WorldId, def: *WeldJointDef) -> JointId #foreign box2d "b2CreateWeldJoint";

/// Set the weld joint linear stiffness in Hertz. 0 is rigid.
WeldJoint_SetLinearHertz :: (jointId: JointId, hertz: float) -> void #foreign box2d "b2WeldJoint_SetLinearHertz";

/// Get the weld joint linear stiffness in Hertz
WeldJoint_GetLinearHertz :: (jointId: JointId) -> float #foreign box2d "b2WeldJoint_GetLinearHertz";

/// Set the weld joint linear damping ratio (non-dimensional)
WeldJoint_SetLinearDampingRatio :: (jointId: JointId, dampingRatio: float) -> void #foreign box2d "b2WeldJoint_SetLinearDampingRatio";

/// Get the weld joint linear damping ratio (non-dimensional)
WeldJoint_GetLinearDampingRatio :: (jointId: JointId) -> float #foreign box2d "b2WeldJoint_GetLinearDampingRatio";

/// Set the weld joint angular stiffness in Hertz. 0 is rigid.
WeldJoint_SetAngularHertz :: (jointId: JointId, hertz: float) -> void #foreign box2d "b2WeldJoint_SetAngularHertz";

/// Get the weld joint angular stiffness in Hertz
WeldJoint_GetAngularHertz :: (jointId: JointId) -> float #foreign box2d "b2WeldJoint_GetAngularHertz";

/// Set weld joint angular damping ratio, non-dimensional
WeldJoint_SetAngularDampingRatio :: (jointId: JointId, dampingRatio: float) -> void #foreign box2d "b2WeldJoint_SetAngularDampingRatio";

/// Get the weld joint angular damping ratio, non-dimensional
WeldJoint_GetAngularDampingRatio :: (jointId: JointId) -> float #foreign box2d "b2WeldJoint_GetAngularDampingRatio";

/// Create a wheel joint
/// @see b2WheelJointDef for details
CreateWheelJoint :: (worldId: WorldId, def: *WheelJointDef) -> JointId #foreign box2d "b2CreateWheelJoint";

/// Enable/disable the wheel joint spring
WheelJoint_EnableSpring :: (jointId: JointId, enableSpring: bool) -> void #foreign box2d "b2WheelJoint_EnableSpring";

/// Is the wheel joint spring enabled?
WheelJoint_IsSpringEnabled :: (jointId: JointId) -> bool #foreign box2d "b2WheelJoint_IsSpringEnabled";

/// Set the wheel joint stiffness in Hertz
WheelJoint_SetSpringHertz :: (jointId: JointId, hertz: float) -> void #foreign box2d "b2WheelJoint_SetSpringHertz";

/// Get the wheel joint stiffness in Hertz
WheelJoint_GetSpringHertz :: (jointId: JointId) -> float #foreign box2d "b2WheelJoint_GetSpringHertz";

/// Set the wheel joint damping ratio, non-dimensional
WheelJoint_SetSpringDampingRatio :: (jointId: JointId, dampingRatio: float) -> void #foreign box2d "b2WheelJoint_SetSpringDampingRatio";

/// Get the wheel joint damping ratio, non-dimensional
WheelJoint_GetSpringDampingRatio :: (jointId: JointId) -> float #foreign box2d "b2WheelJoint_GetSpringDampingRatio";

/// Enable/disable the wheel joint limit
WheelJoint_EnableLimit :: (jointId: JointId, enableLimit: bool) -> void #foreign box2d "b2WheelJoint_EnableLimit";

/// Is the wheel joint limit enabled?
WheelJoint_IsLimitEnabled :: (jointId: JointId) -> bool #foreign box2d "b2WheelJoint_IsLimitEnabled";

/// Get the wheel joint lower limit
WheelJoint_GetLowerLimit :: (jointId: JointId) -> float #foreign box2d "b2WheelJoint_GetLowerLimit";

/// Get the wheel joint upper limit
WheelJoint_GetUpperLimit :: (jointId: JointId) -> float #foreign box2d "b2WheelJoint_GetUpperLimit";

/// Set the wheel joint limits
WheelJoint_SetLimits :: (jointId: JointId, lower: float, upper: float) -> void #foreign box2d "b2WheelJoint_SetLimits";

/// Enable/disable the wheel joint motor
WheelJoint_EnableMotor :: (jointId: JointId, enableMotor: bool) -> void #foreign box2d "b2WheelJoint_EnableMotor";

/// Is the wheel joint motor enabled?
WheelJoint_IsMotorEnabled :: (jointId: JointId) -> bool #foreign box2d "b2WheelJoint_IsMotorEnabled";

/// Set the wheel joint motor speed in radians per second
WheelJoint_SetMotorSpeed :: (jointId: JointId, motorSpeed: float) -> void #foreign box2d "b2WheelJoint_SetMotorSpeed";

/// Get the wheel joint motor speed in radians per second
WheelJoint_GetMotorSpeed :: (jointId: JointId) -> float #foreign box2d "b2WheelJoint_GetMotorSpeed";

/// Set the wheel joint maximum motor torque, usually in newton-meters
WheelJoint_SetMaxMotorTorque :: (jointId: JointId, torque: float) -> void #foreign box2d "b2WheelJoint_SetMaxMotorTorque";

/// Get the wheel joint maximum motor torque, usually in newton-meters
WheelJoint_GetMaxMotorTorque :: (jointId: JointId) -> float #foreign box2d "b2WheelJoint_GetMaxMotorTorque";

/// Get the wheel joint current motor torque, usually in newton-meters
WheelJoint_GetMotorTorque :: (jointId: JointId) -> float #foreign box2d "b2WheelJoint_GetMotorTorque";

#scope_file

#import "Basic"; // For assert

box2d :: #library,no_dll "./box2d";

#run {
    {
        info := type_info(Version);
        for info.members {
            if it.name == {
                case "major";
                    assert(it.offset_in_bytes == 0, "Version.major has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Version.major has unexpected size % instead of 4", it.type.runtime_size);
                case "minor";
                    assert(it.offset_in_bytes == 4, "Version.minor has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Version.minor has unexpected size % instead of 4", it.type.runtime_size);
                case "revision";
                    assert(it.offset_in_bytes == 8, "Version.revision has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Version.revision has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Version) == 12, "Version has size % instead of 12", size_of(Version));
    }

    {
        info := type_info(Vec2);
        for info.members {
            if it.name == {
                case "x";
                    assert(it.offset_in_bytes == 0, "Vec2.x has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Vec2.x has unexpected size % instead of 4", it.type.runtime_size);
                case "y";
                    assert(it.offset_in_bytes == 4, "Vec2.y has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Vec2.y has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Vec2) == 8, "Vec2 has size % instead of 8", size_of(Vec2));
    }

    {
        info := type_info(CosSin);
        for info.members {
            if it.name == {
                case "cosine";
                    assert(it.offset_in_bytes == 0, "CosSin.cosine has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "CosSin.cosine has unexpected size % instead of 4", it.type.runtime_size);
                case "sine";
                    assert(it.offset_in_bytes == 4, "CosSin.sine has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "CosSin.sine has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(CosSin) == 8, "CosSin has size % instead of 8", size_of(CosSin));
    }

    {
        info := type_info(Rot);
        for info.members {
            if it.name == {
                case "c";
                    assert(it.offset_in_bytes == 0, "Rot.c has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Rot.c has unexpected size % instead of 4", it.type.runtime_size);
                case "s";
                    assert(it.offset_in_bytes == 4, "Rot.s has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Rot.s has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Rot) == 8, "Rot has size % instead of 8", size_of(Rot));
    }

    {
        info := type_info(Transform);
        for info.members {
            if it.name == {
                case "p";
                    assert(it.offset_in_bytes == 0, "Transform.p has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Transform.p has unexpected size % instead of 8", it.type.runtime_size);
                case "q";
                    assert(it.offset_in_bytes == 8, "Transform.q has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Transform.q has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(Transform) == 16, "Transform has size % instead of 16", size_of(Transform));
    }

    {
        info := type_info(Mat22);
        for info.members {
            if it.name == {
                case "cx";
                    assert(it.offset_in_bytes == 0, "Mat22.cx has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Mat22.cx has unexpected size % instead of 8", it.type.runtime_size);
                case "cy";
                    assert(it.offset_in_bytes == 8, "Mat22.cy has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Mat22.cy has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(Mat22) == 16, "Mat22 has size % instead of 16", size_of(Mat22));
    }

    {
        info := type_info(AABB);
        for info.members {
            if it.name == {
                case "lowerBound";
                    assert(it.offset_in_bytes == 0, "AABB.lowerBound has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "AABB.lowerBound has unexpected size % instead of 8", it.type.runtime_size);
                case "upperBound";
                    assert(it.offset_in_bytes == 8, "AABB.upperBound has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "AABB.upperBound has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(AABB) == 16, "AABB has size % instead of 16", size_of(AABB));
    }

    {
        info := type_info(Plane);
        for info.members {
            if it.name == {
                case "normal";
                    assert(it.offset_in_bytes == 0, "Plane.normal has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Plane.normal has unexpected size % instead of 8", it.type.runtime_size);
                case "offset";
                    assert(it.offset_in_bytes == 8, "Plane.offset has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Plane.offset has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Plane) == 12, "Plane has size % instead of 12", size_of(Plane));
    }

    {
        info := type_info(RayCastInput);
        for info.members {
            if it.name == {
                case "origin";
                    assert(it.offset_in_bytes == 0, "RayCastInput.origin has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RayCastInput.origin has unexpected size % instead of 8", it.type.runtime_size);
                case "translation";
                    assert(it.offset_in_bytes == 8, "RayCastInput.translation has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RayCastInput.translation has unexpected size % instead of 8", it.type.runtime_size);
                case "maxFraction";
                    assert(it.offset_in_bytes == 16, "RayCastInput.maxFraction has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RayCastInput.maxFraction has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(RayCastInput) == 20, "RayCastInput has size % instead of 20", size_of(RayCastInput));
    }

    {
        info := type_info(ShapeProxy);
        for info.members {
            if it.name == {
                case "points";
                    assert(it.offset_in_bytes == 0, "ShapeProxy.points has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "ShapeProxy.points has unexpected size % instead of 64", it.type.runtime_size);
                case "count";
                    assert(it.offset_in_bytes == 64, "ShapeProxy.count has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ShapeProxy.count has unexpected size % instead of 4", it.type.runtime_size);
                case "radius";
                    assert(it.offset_in_bytes == 68, "ShapeProxy.radius has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ShapeProxy.radius has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(ShapeProxy) == 72, "ShapeProxy has size % instead of 72", size_of(ShapeProxy));
    }

    {
        info := type_info(ShapeCastInput);
        for info.members {
            if it.name == {
                case "proxy";
                    assert(it.offset_in_bytes == 0, "ShapeCastInput.proxy has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 72, "ShapeCastInput.proxy has unexpected size % instead of 72", it.type.runtime_size);
                case "translation";
                    assert(it.offset_in_bytes == 72, "ShapeCastInput.translation has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ShapeCastInput.translation has unexpected size % instead of 8", it.type.runtime_size);
                case "maxFraction";
                    assert(it.offset_in_bytes == 80, "ShapeCastInput.maxFraction has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ShapeCastInput.maxFraction has unexpected size % instead of 4", it.type.runtime_size);
                case "canEncroach";
                    assert(it.offset_in_bytes == 84, "ShapeCastInput.canEncroach has unexpected offset % instead of 84", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeCastInput.canEncroach has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(ShapeCastInput) == 88, "ShapeCastInput has size % instead of 88", size_of(ShapeCastInput));
    }

    {
        info := type_info(CastOutput);
        for info.members {
            if it.name == {
                case "normal";
                    assert(it.offset_in_bytes == 0, "CastOutput.normal has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "CastOutput.normal has unexpected size % instead of 8", it.type.runtime_size);
                case "point";
                    assert(it.offset_in_bytes == 8, "CastOutput.point has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "CastOutput.point has unexpected size % instead of 8", it.type.runtime_size);
                case "fraction";
                    assert(it.offset_in_bytes == 16, "CastOutput.fraction has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "CastOutput.fraction has unexpected size % instead of 4", it.type.runtime_size);
                case "iterations";
                    assert(it.offset_in_bytes == 20, "CastOutput.iterations has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "CastOutput.iterations has unexpected size % instead of 4", it.type.runtime_size);
                case "hit";
                    assert(it.offset_in_bytes == 24, "CastOutput.hit has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "CastOutput.hit has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(CastOutput) == 28, "CastOutput has size % instead of 28", size_of(CastOutput));
    }

    {
        info := type_info(MassData);
        for info.members {
            if it.name == {
                case "mass";
                    assert(it.offset_in_bytes == 0, "MassData.mass has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MassData.mass has unexpected size % instead of 4", it.type.runtime_size);
                case "center";
                    assert(it.offset_in_bytes == 4, "MassData.center has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MassData.center has unexpected size % instead of 8", it.type.runtime_size);
                case "rotationalInertia";
                    assert(it.offset_in_bytes == 12, "MassData.rotationalInertia has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MassData.rotationalInertia has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(MassData) == 16, "MassData has size % instead of 16", size_of(MassData));
    }

    {
        info := type_info(Circle);
        for info.members {
            if it.name == {
                case "center";
                    assert(it.offset_in_bytes == 0, "Circle.center has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Circle.center has unexpected size % instead of 8", it.type.runtime_size);
                case "radius";
                    assert(it.offset_in_bytes == 8, "Circle.radius has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Circle.radius has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Circle) == 12, "Circle has size % instead of 12", size_of(Circle));
    }

    {
        info := type_info(Capsule);
        for info.members {
            if it.name == {
                case "center1";
                    assert(it.offset_in_bytes == 0, "Capsule.center1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Capsule.center1 has unexpected size % instead of 8", it.type.runtime_size);
                case "center2";
                    assert(it.offset_in_bytes == 8, "Capsule.center2 has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Capsule.center2 has unexpected size % instead of 8", it.type.runtime_size);
                case "radius";
                    assert(it.offset_in_bytes == 16, "Capsule.radius has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Capsule.radius has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Capsule) == 20, "Capsule has size % instead of 20", size_of(Capsule));
    }

    {
        info := type_info(Polygon);
        for info.members {
            if it.name == {
                case "vertices";
                    assert(it.offset_in_bytes == 0, "Polygon.vertices has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "Polygon.vertices has unexpected size % instead of 64", it.type.runtime_size);
                case "normals";
                    assert(it.offset_in_bytes == 64, "Polygon.normals has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "Polygon.normals has unexpected size % instead of 64", it.type.runtime_size);
                case "centroid";
                    assert(it.offset_in_bytes == 128, "Polygon.centroid has unexpected offset % instead of 128", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Polygon.centroid has unexpected size % instead of 8", it.type.runtime_size);
                case "radius";
                    assert(it.offset_in_bytes == 136, "Polygon.radius has unexpected offset % instead of 136", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Polygon.radius has unexpected size % instead of 4", it.type.runtime_size);
                case "count";
                    assert(it.offset_in_bytes == 140, "Polygon.count has unexpected offset % instead of 140", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Polygon.count has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Polygon) == 144, "Polygon has size % instead of 144", size_of(Polygon));
    }

    {
        info := type_info(Segment);
        for info.members {
            if it.name == {
                case "point1";
                    assert(it.offset_in_bytes == 0, "Segment.point1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Segment.point1 has unexpected size % instead of 8", it.type.runtime_size);
                case "point2";
                    assert(it.offset_in_bytes == 8, "Segment.point2 has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Segment.point2 has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(Segment) == 16, "Segment has size % instead of 16", size_of(Segment));
    }

    {
        info := type_info(ChainSegment);
        for info.members {
            if it.name == {
                case "ghost1";
                    assert(it.offset_in_bytes == 0, "ChainSegment.ghost1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ChainSegment.ghost1 has unexpected size % instead of 8", it.type.runtime_size);
                case "segment";
                    assert(it.offset_in_bytes == 8, "ChainSegment.segment has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "ChainSegment.segment has unexpected size % instead of 16", it.type.runtime_size);
                case "ghost2";
                    assert(it.offset_in_bytes == 24, "ChainSegment.ghost2 has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ChainSegment.ghost2 has unexpected size % instead of 8", it.type.runtime_size);
                case "chainId";
                    assert(it.offset_in_bytes == 32, "ChainSegment.chainId has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ChainSegment.chainId has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(ChainSegment) == 36, "ChainSegment has size % instead of 36", size_of(ChainSegment));
    }

    {
        info := type_info(Hull);
        for info.members {
            if it.name == {
                case "points";
                    assert(it.offset_in_bytes == 0, "Hull.points has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "Hull.points has unexpected size % instead of 64", it.type.runtime_size);
                case "count";
                    assert(it.offset_in_bytes == 64, "Hull.count has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Hull.count has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Hull) == 68, "Hull has size % instead of 68", size_of(Hull));
    }

    {
        info := type_info(SegmentDistanceResult);
        for info.members {
            if it.name == {
                case "closest1";
                    assert(it.offset_in_bytes == 0, "SegmentDistanceResult.closest1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SegmentDistanceResult.closest1 has unexpected size % instead of 8", it.type.runtime_size);
                case "closest2";
                    assert(it.offset_in_bytes == 8, "SegmentDistanceResult.closest2 has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SegmentDistanceResult.closest2 has unexpected size % instead of 8", it.type.runtime_size);
                case "fraction1";
                    assert(it.offset_in_bytes == 16, "SegmentDistanceResult.fraction1 has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SegmentDistanceResult.fraction1 has unexpected size % instead of 4", it.type.runtime_size);
                case "fraction2";
                    assert(it.offset_in_bytes == 20, "SegmentDistanceResult.fraction2 has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SegmentDistanceResult.fraction2 has unexpected size % instead of 4", it.type.runtime_size);
                case "distanceSquared";
                    assert(it.offset_in_bytes == 24, "SegmentDistanceResult.distanceSquared has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SegmentDistanceResult.distanceSquared has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(SegmentDistanceResult) == 28, "SegmentDistanceResult has size % instead of 28", size_of(SegmentDistanceResult));
    }

    {
        info := type_info(SimplexCache);
        for info.members {
            if it.name == {
                case "count";
                    assert(it.offset_in_bytes == 0, "SimplexCache.count has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "SimplexCache.count has unexpected size % instead of 2", it.type.runtime_size);
                case "indexA";
                    assert(it.offset_in_bytes == 2, "SimplexCache.indexA has unexpected offset % instead of 2", it.offset_in_bytes);
                    assert(it.type.runtime_size == 3, "SimplexCache.indexA has unexpected size % instead of 3", it.type.runtime_size);
                case "indexB";
                    assert(it.offset_in_bytes == 5, "SimplexCache.indexB has unexpected offset % instead of 5", it.offset_in_bytes);
                    assert(it.type.runtime_size == 3, "SimplexCache.indexB has unexpected size % instead of 3", it.type.runtime_size);
            }
        }
        assert(size_of(SimplexCache) == 8, "SimplexCache has size % instead of 8", size_of(SimplexCache));
    }

    {
        info := type_info(DistanceInput);
        for info.members {
            if it.name == {
                case "proxyA";
                    assert(it.offset_in_bytes == 0, "DistanceInput.proxyA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 72, "DistanceInput.proxyA has unexpected size % instead of 72", it.type.runtime_size);
                case "proxyB";
                    assert(it.offset_in_bytes == 72, "DistanceInput.proxyB has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 72, "DistanceInput.proxyB has unexpected size % instead of 72", it.type.runtime_size);
                case "transformA";
                    assert(it.offset_in_bytes == 144, "DistanceInput.transformA has unexpected offset % instead of 144", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "DistanceInput.transformA has unexpected size % instead of 16", it.type.runtime_size);
                case "transformB";
                    assert(it.offset_in_bytes == 160, "DistanceInput.transformB has unexpected offset % instead of 160", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "DistanceInput.transformB has unexpected size % instead of 16", it.type.runtime_size);
                case "useRadii";
                    assert(it.offset_in_bytes == 176, "DistanceInput.useRadii has unexpected offset % instead of 176", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DistanceInput.useRadii has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(DistanceInput) == 180, "DistanceInput has size % instead of 180", size_of(DistanceInput));
    }

    {
        info := type_info(DistanceOutput);
        for info.members {
            if it.name == {
                case "pointA";
                    assert(it.offset_in_bytes == 0, "DistanceOutput.pointA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceOutput.pointA has unexpected size % instead of 8", it.type.runtime_size);
                case "pointB";
                    assert(it.offset_in_bytes == 8, "DistanceOutput.pointB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceOutput.pointB has unexpected size % instead of 8", it.type.runtime_size);
                case "normal";
                    assert(it.offset_in_bytes == 16, "DistanceOutput.normal has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceOutput.normal has unexpected size % instead of 8", it.type.runtime_size);
                case "distance";
                    assert(it.offset_in_bytes == 24, "DistanceOutput.distance has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceOutput.distance has unexpected size % instead of 4", it.type.runtime_size);
                case "iterations";
                    assert(it.offset_in_bytes == 28, "DistanceOutput.iterations has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceOutput.iterations has unexpected size % instead of 4", it.type.runtime_size);
                case "simplexCount";
                    assert(it.offset_in_bytes == 32, "DistanceOutput.simplexCount has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceOutput.simplexCount has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(DistanceOutput) == 36, "DistanceOutput has size % instead of 36", size_of(DistanceOutput));
    }

    {
        info := type_info(SimplexVertex);
        for info.members {
            if it.name == {
                case "wA";
                    assert(it.offset_in_bytes == 0, "SimplexVertex.wA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SimplexVertex.wA has unexpected size % instead of 8", it.type.runtime_size);
                case "wB";
                    assert(it.offset_in_bytes == 8, "SimplexVertex.wB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SimplexVertex.wB has unexpected size % instead of 8", it.type.runtime_size);
                case "w";
                    assert(it.offset_in_bytes == 16, "SimplexVertex.w has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SimplexVertex.w has unexpected size % instead of 8", it.type.runtime_size);
                case "a";
                    assert(it.offset_in_bytes == 24, "SimplexVertex.a has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SimplexVertex.a has unexpected size % instead of 4", it.type.runtime_size);
                case "indexA";
                    assert(it.offset_in_bytes == 28, "SimplexVertex.indexA has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SimplexVertex.indexA has unexpected size % instead of 4", it.type.runtime_size);
                case "indexB";
                    assert(it.offset_in_bytes == 32, "SimplexVertex.indexB has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SimplexVertex.indexB has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(SimplexVertex) == 36, "SimplexVertex has size % instead of 36", size_of(SimplexVertex));
    }

    {
        info := type_info(Simplex);
        for info.members {
            if it.name == {
                case "v1";
                    assert(it.offset_in_bytes == 0, "Simplex.v1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 36, "Simplex.v1 has unexpected size % instead of 36", it.type.runtime_size);
                case "v2";
                    assert(it.offset_in_bytes == 36, "Simplex.v2 has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 36, "Simplex.v2 has unexpected size % instead of 36", it.type.runtime_size);
                case "v3";
                    assert(it.offset_in_bytes == 72, "Simplex.v3 has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 36, "Simplex.v3 has unexpected size % instead of 36", it.type.runtime_size);
                case "count";
                    assert(it.offset_in_bytes == 108, "Simplex.count has unexpected offset % instead of 108", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Simplex.count has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Simplex) == 112, "Simplex has size % instead of 112", size_of(Simplex));
    }

    {
        info := type_info(ShapeCastPairInput);
        for info.members {
            if it.name == {
                case "proxyA";
                    assert(it.offset_in_bytes == 0, "ShapeCastPairInput.proxyA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 72, "ShapeCastPairInput.proxyA has unexpected size % instead of 72", it.type.runtime_size);
                case "proxyB";
                    assert(it.offset_in_bytes == 72, "ShapeCastPairInput.proxyB has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 72, "ShapeCastPairInput.proxyB has unexpected size % instead of 72", it.type.runtime_size);
                case "transformA";
                    assert(it.offset_in_bytes == 144, "ShapeCastPairInput.transformA has unexpected offset % instead of 144", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "ShapeCastPairInput.transformA has unexpected size % instead of 16", it.type.runtime_size);
                case "transformB";
                    assert(it.offset_in_bytes == 160, "ShapeCastPairInput.transformB has unexpected offset % instead of 160", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "ShapeCastPairInput.transformB has unexpected size % instead of 16", it.type.runtime_size);
                case "translationB";
                    assert(it.offset_in_bytes == 176, "ShapeCastPairInput.translationB has unexpected offset % instead of 176", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ShapeCastPairInput.translationB has unexpected size % instead of 8", it.type.runtime_size);
                case "maxFraction";
                    assert(it.offset_in_bytes == 184, "ShapeCastPairInput.maxFraction has unexpected offset % instead of 184", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ShapeCastPairInput.maxFraction has unexpected size % instead of 4", it.type.runtime_size);
                case "canEncroach";
                    assert(it.offset_in_bytes == 188, "ShapeCastPairInput.canEncroach has unexpected offset % instead of 188", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeCastPairInput.canEncroach has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(ShapeCastPairInput) == 192, "ShapeCastPairInput has size % instead of 192", size_of(ShapeCastPairInput));
    }

    {
        info := type_info(Sweep);
        for info.members {
            if it.name == {
                case "localCenter";
                    assert(it.offset_in_bytes == 0, "Sweep.localCenter has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Sweep.localCenter has unexpected size % instead of 8", it.type.runtime_size);
                case "c1";
                    assert(it.offset_in_bytes == 8, "Sweep.c1 has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Sweep.c1 has unexpected size % instead of 8", it.type.runtime_size);
                case "c2";
                    assert(it.offset_in_bytes == 16, "Sweep.c2 has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Sweep.c2 has unexpected size % instead of 8", it.type.runtime_size);
                case "q1";
                    assert(it.offset_in_bytes == 24, "Sweep.q1 has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Sweep.q1 has unexpected size % instead of 8", it.type.runtime_size);
                case "q2";
                    assert(it.offset_in_bytes == 32, "Sweep.q2 has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Sweep.q2 has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(Sweep) == 40, "Sweep has size % instead of 40", size_of(Sweep));
    }

    {
        info := type_info(TOIInput);
        for info.members {
            if it.name == {
                case "proxyA";
                    assert(it.offset_in_bytes == 0, "TOIInput.proxyA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 72, "TOIInput.proxyA has unexpected size % instead of 72", it.type.runtime_size);
                case "proxyB";
                    assert(it.offset_in_bytes == 72, "TOIInput.proxyB has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 72, "TOIInput.proxyB has unexpected size % instead of 72", it.type.runtime_size);
                case "sweepA";
                    assert(it.offset_in_bytes == 144, "TOIInput.sweepA has unexpected offset % instead of 144", it.offset_in_bytes);
                    assert(it.type.runtime_size == 40, "TOIInput.sweepA has unexpected size % instead of 40", it.type.runtime_size);
                case "sweepB";
                    assert(it.offset_in_bytes == 184, "TOIInput.sweepB has unexpected offset % instead of 184", it.offset_in_bytes);
                    assert(it.type.runtime_size == 40, "TOIInput.sweepB has unexpected size % instead of 40", it.type.runtime_size);
                case "maxFraction";
                    assert(it.offset_in_bytes == 224, "TOIInput.maxFraction has unexpected offset % instead of 224", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "TOIInput.maxFraction has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(TOIInput) == 228, "TOIInput has size % instead of 228", size_of(TOIInput));
    }

    {
        info := type_info(TOIOutput);
        for info.members {
            if it.name == {
                case "state";
                    assert(it.offset_in_bytes == 0, "TOIOutput.state has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "TOIOutput.state has unexpected size % instead of 4", it.type.runtime_size);
                case "fraction";
                    assert(it.offset_in_bytes == 4, "TOIOutput.fraction has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "TOIOutput.fraction has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(TOIOutput) == 8, "TOIOutput has size % instead of 8", size_of(TOIOutput));
    }

    {
        info := type_info(ManifoldPoint);
        for info.members {
            if it.name == {
                case "point";
                    assert(it.offset_in_bytes == 0, "ManifoldPoint.point has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ManifoldPoint.point has unexpected size % instead of 8", it.type.runtime_size);
                case "anchorA";
                    assert(it.offset_in_bytes == 8, "ManifoldPoint.anchorA has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ManifoldPoint.anchorA has unexpected size % instead of 8", it.type.runtime_size);
                case "anchorB";
                    assert(it.offset_in_bytes == 16, "ManifoldPoint.anchorB has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ManifoldPoint.anchorB has unexpected size % instead of 8", it.type.runtime_size);
                case "separation";
                    assert(it.offset_in_bytes == 24, "ManifoldPoint.separation has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ManifoldPoint.separation has unexpected size % instead of 4", it.type.runtime_size);
                case "normalImpulse";
                    assert(it.offset_in_bytes == 28, "ManifoldPoint.normalImpulse has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ManifoldPoint.normalImpulse has unexpected size % instead of 4", it.type.runtime_size);
                case "tangentImpulse";
                    assert(it.offset_in_bytes == 32, "ManifoldPoint.tangentImpulse has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ManifoldPoint.tangentImpulse has unexpected size % instead of 4", it.type.runtime_size);
                case "totalNormalImpulse";
                    assert(it.offset_in_bytes == 36, "ManifoldPoint.totalNormalImpulse has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ManifoldPoint.totalNormalImpulse has unexpected size % instead of 4", it.type.runtime_size);
                case "normalVelocity";
                    assert(it.offset_in_bytes == 40, "ManifoldPoint.normalVelocity has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ManifoldPoint.normalVelocity has unexpected size % instead of 4", it.type.runtime_size);
                case "id";
                    assert(it.offset_in_bytes == 44, "ManifoldPoint.id has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "ManifoldPoint.id has unexpected size % instead of 2", it.type.runtime_size);
                case "persisted";
                    assert(it.offset_in_bytes == 46, "ManifoldPoint.persisted has unexpected offset % instead of 46", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ManifoldPoint.persisted has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(ManifoldPoint) == 48, "ManifoldPoint has size % instead of 48", size_of(ManifoldPoint));
    }

    {
        info := type_info(Manifold);
        for info.members {
            if it.name == {
                case "normal";
                    assert(it.offset_in_bytes == 0, "Manifold.normal has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Manifold.normal has unexpected size % instead of 8", it.type.runtime_size);
                case "rollingImpulse";
                    assert(it.offset_in_bytes == 8, "Manifold.rollingImpulse has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Manifold.rollingImpulse has unexpected size % instead of 4", it.type.runtime_size);
                case "points";
                    assert(it.offset_in_bytes == 12, "Manifold.points has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 96, "Manifold.points has unexpected size % instead of 96", it.type.runtime_size);
                case "pointCount";
                    assert(it.offset_in_bytes == 108, "Manifold.pointCount has unexpected offset % instead of 108", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Manifold.pointCount has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Manifold) == 112, "Manifold has size % instead of 112", size_of(Manifold));
    }

    {
        info := type_info(DynamicTree);
        for info.members {
            if it.name == {
                case "nodes";
                    assert(it.offset_in_bytes == 0, "DynamicTree.nodes has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DynamicTree.nodes has unexpected size % instead of 8", it.type.runtime_size);
                case "root";
                    assert(it.offset_in_bytes == 8, "DynamicTree.root has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DynamicTree.root has unexpected size % instead of 4", it.type.runtime_size);
                case "nodeCount";
                    assert(it.offset_in_bytes == 12, "DynamicTree.nodeCount has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DynamicTree.nodeCount has unexpected size % instead of 4", it.type.runtime_size);
                case "nodeCapacity";
                    assert(it.offset_in_bytes == 16, "DynamicTree.nodeCapacity has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DynamicTree.nodeCapacity has unexpected size % instead of 4", it.type.runtime_size);
                case "freeList";
                    assert(it.offset_in_bytes == 20, "DynamicTree.freeList has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DynamicTree.freeList has unexpected size % instead of 4", it.type.runtime_size);
                case "proxyCount";
                    assert(it.offset_in_bytes == 24, "DynamicTree.proxyCount has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DynamicTree.proxyCount has unexpected size % instead of 4", it.type.runtime_size);
                case "leafIndices";
                    assert(it.offset_in_bytes == 32, "DynamicTree.leafIndices has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DynamicTree.leafIndices has unexpected size % instead of 8", it.type.runtime_size);
                case "leafBoxes";
                    assert(it.offset_in_bytes == 40, "DynamicTree.leafBoxes has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DynamicTree.leafBoxes has unexpected size % instead of 8", it.type.runtime_size);
                case "leafCenters";
                    assert(it.offset_in_bytes == 48, "DynamicTree.leafCenters has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DynamicTree.leafCenters has unexpected size % instead of 8", it.type.runtime_size);
                case "binIndices";
                    assert(it.offset_in_bytes == 56, "DynamicTree.binIndices has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DynamicTree.binIndices has unexpected size % instead of 8", it.type.runtime_size);
                case "rebuildCapacity";
                    assert(it.offset_in_bytes == 64, "DynamicTree.rebuildCapacity has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DynamicTree.rebuildCapacity has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(DynamicTree) == 72, "DynamicTree has size % instead of 72", size_of(DynamicTree));
    }

    {
        info := type_info(TreeStats);
        for info.members {
            if it.name == {
                case "nodeVisits";
                    assert(it.offset_in_bytes == 0, "TreeStats.nodeVisits has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "TreeStats.nodeVisits has unexpected size % instead of 4", it.type.runtime_size);
                case "leafVisits";
                    assert(it.offset_in_bytes == 4, "TreeStats.leafVisits has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "TreeStats.leafVisits has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(TreeStats) == 8, "TreeStats has size % instead of 8", size_of(TreeStats));
    }

    {
        info := type_info(PlaneResult);
        for info.members {
            if it.name == {
                case "plane";
                    assert(it.offset_in_bytes == 0, "PlaneResult.plane has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 12, "PlaneResult.plane has unexpected size % instead of 12", it.type.runtime_size);
                case "point";
                    assert(it.offset_in_bytes == 12, "PlaneResult.point has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PlaneResult.point has unexpected size % instead of 8", it.type.runtime_size);
                case "hit";
                    assert(it.offset_in_bytes == 20, "PlaneResult.hit has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "PlaneResult.hit has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(PlaneResult) == 24, "PlaneResult has size % instead of 24", size_of(PlaneResult));
    }

    {
        info := type_info(CollisionPlane);
        for info.members {
            if it.name == {
                case "plane";
                    assert(it.offset_in_bytes == 0, "CollisionPlane.plane has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 12, "CollisionPlane.plane has unexpected size % instead of 12", it.type.runtime_size);
                case "pushLimit";
                    assert(it.offset_in_bytes == 12, "CollisionPlane.pushLimit has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "CollisionPlane.pushLimit has unexpected size % instead of 4", it.type.runtime_size);
                case "push";
                    assert(it.offset_in_bytes == 16, "CollisionPlane.push has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "CollisionPlane.push has unexpected size % instead of 4", it.type.runtime_size);
                case "clipVelocity";
                    assert(it.offset_in_bytes == 20, "CollisionPlane.clipVelocity has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "CollisionPlane.clipVelocity has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(CollisionPlane) == 24, "CollisionPlane has size % instead of 24", size_of(CollisionPlane));
    }

    {
        info := type_info(PlaneSolverResult);
        for info.members {
            if it.name == {
                case "translation";
                    assert(it.offset_in_bytes == 0, "PlaneSolverResult.translation has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PlaneSolverResult.translation has unexpected size % instead of 8", it.type.runtime_size);
                case "iterationCount";
                    assert(it.offset_in_bytes == 8, "PlaneSolverResult.iterationCount has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PlaneSolverResult.iterationCount has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(PlaneSolverResult) == 12, "PlaneSolverResult has size % instead of 12", size_of(PlaneSolverResult));
    }

    {
        info := type_info(WorldId);
        for info.members {
            if it.name == {
                case "index1";
                    assert(it.offset_in_bytes == 0, "WorldId.index1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "WorldId.index1 has unexpected size % instead of 2", it.type.runtime_size);
                case "generation";
                    assert(it.offset_in_bytes == 2, "WorldId.generation has unexpected offset % instead of 2", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "WorldId.generation has unexpected size % instead of 2", it.type.runtime_size);
            }
        }
        assert(size_of(WorldId) == 4, "WorldId has size % instead of 4", size_of(WorldId));
    }

    {
        info := type_info(BodyId);
        for info.members {
            if it.name == {
                case "index1";
                    assert(it.offset_in_bytes == 0, "BodyId.index1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyId.index1 has unexpected size % instead of 4", it.type.runtime_size);
                case "world0";
                    assert(it.offset_in_bytes == 4, "BodyId.world0 has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "BodyId.world0 has unexpected size % instead of 2", it.type.runtime_size);
                case "generation";
                    assert(it.offset_in_bytes == 6, "BodyId.generation has unexpected offset % instead of 6", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "BodyId.generation has unexpected size % instead of 2", it.type.runtime_size);
            }
        }
        assert(size_of(BodyId) == 8, "BodyId has size % instead of 8", size_of(BodyId));
    }

    {
        info := type_info(ShapeId);
        for info.members {
            if it.name == {
                case "index1";
                    assert(it.offset_in_bytes == 0, "ShapeId.index1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ShapeId.index1 has unexpected size % instead of 4", it.type.runtime_size);
                case "world0";
                    assert(it.offset_in_bytes == 4, "ShapeId.world0 has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "ShapeId.world0 has unexpected size % instead of 2", it.type.runtime_size);
                case "generation";
                    assert(it.offset_in_bytes == 6, "ShapeId.generation has unexpected offset % instead of 6", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "ShapeId.generation has unexpected size % instead of 2", it.type.runtime_size);
            }
        }
        assert(size_of(ShapeId) == 8, "ShapeId has size % instead of 8", size_of(ShapeId));
    }

    {
        info := type_info(ChainId);
        for info.members {
            if it.name == {
                case "index1";
                    assert(it.offset_in_bytes == 0, "ChainId.index1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ChainId.index1 has unexpected size % instead of 4", it.type.runtime_size);
                case "world0";
                    assert(it.offset_in_bytes == 4, "ChainId.world0 has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "ChainId.world0 has unexpected size % instead of 2", it.type.runtime_size);
                case "generation";
                    assert(it.offset_in_bytes == 6, "ChainId.generation has unexpected offset % instead of 6", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "ChainId.generation has unexpected size % instead of 2", it.type.runtime_size);
            }
        }
        assert(size_of(ChainId) == 8, "ChainId has size % instead of 8", size_of(ChainId));
    }

    {
        info := type_info(JointId);
        for info.members {
            if it.name == {
                case "index1";
                    assert(it.offset_in_bytes == 0, "JointId.index1 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "JointId.index1 has unexpected size % instead of 4", it.type.runtime_size);
                case "world0";
                    assert(it.offset_in_bytes == 4, "JointId.world0 has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "JointId.world0 has unexpected size % instead of 2", it.type.runtime_size);
                case "generation";
                    assert(it.offset_in_bytes == 6, "JointId.generation has unexpected offset % instead of 6", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "JointId.generation has unexpected size % instead of 2", it.type.runtime_size);
            }
        }
        assert(size_of(JointId) == 8, "JointId has size % instead of 8", size_of(JointId));
    }

    {
        info := type_info(RayResult);
        for info.members {
            if it.name == {
                case "shapeId";
                    assert(it.offset_in_bytes == 0, "RayResult.shapeId has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RayResult.shapeId has unexpected size % instead of 8", it.type.runtime_size);
                case "point";
                    assert(it.offset_in_bytes == 8, "RayResult.point has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RayResult.point has unexpected size % instead of 8", it.type.runtime_size);
                case "normal";
                    assert(it.offset_in_bytes == 16, "RayResult.normal has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RayResult.normal has unexpected size % instead of 8", it.type.runtime_size);
                case "fraction";
                    assert(it.offset_in_bytes == 24, "RayResult.fraction has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RayResult.fraction has unexpected size % instead of 4", it.type.runtime_size);
                case "nodeVisits";
                    assert(it.offset_in_bytes == 28, "RayResult.nodeVisits has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RayResult.nodeVisits has unexpected size % instead of 4", it.type.runtime_size);
                case "leafVisits";
                    assert(it.offset_in_bytes == 32, "RayResult.leafVisits has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RayResult.leafVisits has unexpected size % instead of 4", it.type.runtime_size);
                case "hit";
                    assert(it.offset_in_bytes == 36, "RayResult.hit has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "RayResult.hit has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(RayResult) == 40, "RayResult has size % instead of 40", size_of(RayResult));
    }

    {
        info := type_info(WorldDef);
        for info.members {
            if it.name == {
                case "gravity";
                    assert(it.offset_in_bytes == 0, "WorldDef.gravity has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WorldDef.gravity has unexpected size % instead of 8", it.type.runtime_size);
                case "restitutionThreshold";
                    assert(it.offset_in_bytes == 8, "WorldDef.restitutionThreshold has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.restitutionThreshold has unexpected size % instead of 4", it.type.runtime_size);
                case "hitEventThreshold";
                    assert(it.offset_in_bytes == 12, "WorldDef.hitEventThreshold has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.hitEventThreshold has unexpected size % instead of 4", it.type.runtime_size);
                case "contactHertz";
                    assert(it.offset_in_bytes == 16, "WorldDef.contactHertz has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.contactHertz has unexpected size % instead of 4", it.type.runtime_size);
                case "contactDampingRatio";
                    assert(it.offset_in_bytes == 20, "WorldDef.contactDampingRatio has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.contactDampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "maxContactPushSpeed";
                    assert(it.offset_in_bytes == 24, "WorldDef.maxContactPushSpeed has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.maxContactPushSpeed has unexpected size % instead of 4", it.type.runtime_size);
                case "maximumLinearSpeed";
                    assert(it.offset_in_bytes == 28, "WorldDef.maximumLinearSpeed has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.maximumLinearSpeed has unexpected size % instead of 4", it.type.runtime_size);
                case "frictionCallback";
                    assert(it.offset_in_bytes == 32, "WorldDef.frictionCallback has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WorldDef.frictionCallback has unexpected size % instead of 8", it.type.runtime_size);
                case "restitutionCallback";
                    assert(it.offset_in_bytes == 40, "WorldDef.restitutionCallback has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WorldDef.restitutionCallback has unexpected size % instead of 8", it.type.runtime_size);
                case "enableSleep";
                    assert(it.offset_in_bytes == 48, "WorldDef.enableSleep has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "WorldDef.enableSleep has unexpected size % instead of 1", it.type.runtime_size);
                case "enableContinuous";
                    assert(it.offset_in_bytes == 49, "WorldDef.enableContinuous has unexpected offset % instead of 49", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "WorldDef.enableContinuous has unexpected size % instead of 1", it.type.runtime_size);
                case "workerCount";
                    assert(it.offset_in_bytes == 52, "WorldDef.workerCount has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.workerCount has unexpected size % instead of 4", it.type.runtime_size);
                case "enqueueTask";
                    assert(it.offset_in_bytes == 56, "WorldDef.enqueueTask has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WorldDef.enqueueTask has unexpected size % instead of 8", it.type.runtime_size);
                case "finishTask";
                    assert(it.offset_in_bytes == 64, "WorldDef.finishTask has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WorldDef.finishTask has unexpected size % instead of 8", it.type.runtime_size);
                case "userTaskContext";
                    assert(it.offset_in_bytes == 72, "WorldDef.userTaskContext has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WorldDef.userTaskContext has unexpected size % instead of 8", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 80, "WorldDef.userData has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WorldDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 88, "WorldDef.internalValue has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WorldDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(WorldDef) == 96, "WorldDef has size % instead of 96", size_of(WorldDef));
    }

    {
        info := type_info(BodyDef);
        for info.members {
            if it.name == {
                case "type";
                    assert(it.offset_in_bytes == 0, "BodyDef.type has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyDef.type has unexpected size % instead of 4", it.type.runtime_size);
                case "position";
                    assert(it.offset_in_bytes == 4, "BodyDef.position has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyDef.position has unexpected size % instead of 8", it.type.runtime_size);
                case "rotation";
                    assert(it.offset_in_bytes == 12, "BodyDef.rotation has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyDef.rotation has unexpected size % instead of 8", it.type.runtime_size);
                case "linearVelocity";
                    assert(it.offset_in_bytes == 20, "BodyDef.linearVelocity has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyDef.linearVelocity has unexpected size % instead of 8", it.type.runtime_size);
                case "angularVelocity";
                    assert(it.offset_in_bytes == 28, "BodyDef.angularVelocity has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyDef.angularVelocity has unexpected size % instead of 4", it.type.runtime_size);
                case "linearDamping";
                    assert(it.offset_in_bytes == 32, "BodyDef.linearDamping has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyDef.linearDamping has unexpected size % instead of 4", it.type.runtime_size);
                case "angularDamping";
                    assert(it.offset_in_bytes == 36, "BodyDef.angularDamping has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyDef.angularDamping has unexpected size % instead of 4", it.type.runtime_size);
                case "gravityScale";
                    assert(it.offset_in_bytes == 40, "BodyDef.gravityScale has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyDef.gravityScale has unexpected size % instead of 4", it.type.runtime_size);
                case "sleepThreshold";
                    assert(it.offset_in_bytes == 44, "BodyDef.sleepThreshold has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyDef.sleepThreshold has unexpected size % instead of 4", it.type.runtime_size);
                case "name";
                    assert(it.offset_in_bytes == 48, "BodyDef.name has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyDef.name has unexpected size % instead of 8", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 56, "BodyDef.userData has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "enableSleep";
                    assert(it.offset_in_bytes == 64, "BodyDef.enableSleep has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "BodyDef.enableSleep has unexpected size % instead of 1", it.type.runtime_size);
                case "isAwake";
                    assert(it.offset_in_bytes == 65, "BodyDef.isAwake has unexpected offset % instead of 65", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "BodyDef.isAwake has unexpected size % instead of 1", it.type.runtime_size);
                case "fixedRotation";
                    assert(it.offset_in_bytes == 66, "BodyDef.fixedRotation has unexpected offset % instead of 66", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "BodyDef.fixedRotation has unexpected size % instead of 1", it.type.runtime_size);
                case "isBullet";
                    assert(it.offset_in_bytes == 67, "BodyDef.isBullet has unexpected offset % instead of 67", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "BodyDef.isBullet has unexpected size % instead of 1", it.type.runtime_size);
                case "isEnabled";
                    assert(it.offset_in_bytes == 68, "BodyDef.isEnabled has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "BodyDef.isEnabled has unexpected size % instead of 1", it.type.runtime_size);
                case "allowFastRotation";
                    assert(it.offset_in_bytes == 69, "BodyDef.allowFastRotation has unexpected offset % instead of 69", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "BodyDef.allowFastRotation has unexpected size % instead of 1", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 72, "BodyDef.internalValue has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(BodyDef) == 80, "BodyDef has size % instead of 80", size_of(BodyDef));
    }

    {
        info := type_info(Filter);
        for info.members {
            if it.name == {
                case "categoryBits";
                    assert(it.offset_in_bytes == 0, "Filter.categoryBits has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Filter.categoryBits has unexpected size % instead of 8", it.type.runtime_size);
                case "maskBits";
                    assert(it.offset_in_bytes == 8, "Filter.maskBits has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "Filter.maskBits has unexpected size % instead of 8", it.type.runtime_size);
                case "groupIndex";
                    assert(it.offset_in_bytes == 16, "Filter.groupIndex has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Filter.groupIndex has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Filter) == 24, "Filter has size % instead of 24", size_of(Filter));
    }

    {
        info := type_info(QueryFilter);
        for info.members {
            if it.name == {
                case "categoryBits";
                    assert(it.offset_in_bytes == 0, "QueryFilter.categoryBits has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QueryFilter.categoryBits has unexpected size % instead of 8", it.type.runtime_size);
                case "maskBits";
                    assert(it.offset_in_bytes == 8, "QueryFilter.maskBits has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QueryFilter.maskBits has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QueryFilter) == 16, "QueryFilter has size % instead of 16", size_of(QueryFilter));
    }

    {
        info := type_info(SurfaceMaterial);
        for info.members {
            if it.name == {
                case "friction";
                    assert(it.offset_in_bytes == 0, "SurfaceMaterial.friction has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SurfaceMaterial.friction has unexpected size % instead of 4", it.type.runtime_size);
                case "restitution";
                    assert(it.offset_in_bytes == 4, "SurfaceMaterial.restitution has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SurfaceMaterial.restitution has unexpected size % instead of 4", it.type.runtime_size);
                case "rollingResistance";
                    assert(it.offset_in_bytes == 8, "SurfaceMaterial.rollingResistance has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SurfaceMaterial.rollingResistance has unexpected size % instead of 4", it.type.runtime_size);
                case "tangentSpeed";
                    assert(it.offset_in_bytes == 12, "SurfaceMaterial.tangentSpeed has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SurfaceMaterial.tangentSpeed has unexpected size % instead of 4", it.type.runtime_size);
                case "userMaterialId";
                    assert(it.offset_in_bytes == 16, "SurfaceMaterial.userMaterialId has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SurfaceMaterial.userMaterialId has unexpected size % instead of 4", it.type.runtime_size);
                case "customColor";
                    assert(it.offset_in_bytes == 20, "SurfaceMaterial.customColor has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SurfaceMaterial.customColor has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(SurfaceMaterial) == 24, "SurfaceMaterial has size % instead of 24", size_of(SurfaceMaterial));
    }

    {
        info := type_info(ShapeDef);
        for info.members {
            if it.name == {
                case "userData";
                    assert(it.offset_in_bytes == 0, "ShapeDef.userData has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ShapeDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "material";
                    assert(it.offset_in_bytes == 8, "ShapeDef.material has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 24, "ShapeDef.material has unexpected size % instead of 24", it.type.runtime_size);
                case "density";
                    assert(it.offset_in_bytes == 32, "ShapeDef.density has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ShapeDef.density has unexpected size % instead of 4", it.type.runtime_size);
                case "filter";
                    assert(it.offset_in_bytes == 40, "ShapeDef.filter has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 24, "ShapeDef.filter has unexpected size % instead of 24", it.type.runtime_size);
                case "isSensor";
                    assert(it.offset_in_bytes == 64, "ShapeDef.isSensor has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeDef.isSensor has unexpected size % instead of 1", it.type.runtime_size);
                case "enableSensorEvents";
                    assert(it.offset_in_bytes == 65, "ShapeDef.enableSensorEvents has unexpected offset % instead of 65", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeDef.enableSensorEvents has unexpected size % instead of 1", it.type.runtime_size);
                case "enableContactEvents";
                    assert(it.offset_in_bytes == 66, "ShapeDef.enableContactEvents has unexpected offset % instead of 66", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeDef.enableContactEvents has unexpected size % instead of 1", it.type.runtime_size);
                case "enableHitEvents";
                    assert(it.offset_in_bytes == 67, "ShapeDef.enableHitEvents has unexpected offset % instead of 67", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeDef.enableHitEvents has unexpected size % instead of 1", it.type.runtime_size);
                case "enablePreSolveEvents";
                    assert(it.offset_in_bytes == 68, "ShapeDef.enablePreSolveEvents has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeDef.enablePreSolveEvents has unexpected size % instead of 1", it.type.runtime_size);
                case "invokeContactCreation";
                    assert(it.offset_in_bytes == 69, "ShapeDef.invokeContactCreation has unexpected offset % instead of 69", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeDef.invokeContactCreation has unexpected size % instead of 1", it.type.runtime_size);
                case "updateBodyMass";
                    assert(it.offset_in_bytes == 70, "ShapeDef.updateBodyMass has unexpected offset % instead of 70", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ShapeDef.updateBodyMass has unexpected size % instead of 1", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 72, "ShapeDef.internalValue has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ShapeDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(ShapeDef) == 80, "ShapeDef has size % instead of 80", size_of(ShapeDef));
    }

    {
        info := type_info(ChainDef);
        for info.members {
            if it.name == {
                case "userData";
                    assert(it.offset_in_bytes == 0, "ChainDef.userData has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ChainDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "points";
                    assert(it.offset_in_bytes == 8, "ChainDef.points has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ChainDef.points has unexpected size % instead of 8", it.type.runtime_size);
                case "count";
                    assert(it.offset_in_bytes == 16, "ChainDef.count has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ChainDef.count has unexpected size % instead of 4", it.type.runtime_size);
                case "materials";
                    assert(it.offset_in_bytes == 24, "ChainDef.materials has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ChainDef.materials has unexpected size % instead of 8", it.type.runtime_size);
                case "materialCount";
                    assert(it.offset_in_bytes == 32, "ChainDef.materialCount has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ChainDef.materialCount has unexpected size % instead of 4", it.type.runtime_size);
                case "filter";
                    assert(it.offset_in_bytes == 40, "ChainDef.filter has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 24, "ChainDef.filter has unexpected size % instead of 24", it.type.runtime_size);
                case "isLoop";
                    assert(it.offset_in_bytes == 64, "ChainDef.isLoop has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ChainDef.isLoop has unexpected size % instead of 1", it.type.runtime_size);
                case "enableSensorEvents";
                    assert(it.offset_in_bytes == 65, "ChainDef.enableSensorEvents has unexpected offset % instead of 65", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "ChainDef.enableSensorEvents has unexpected size % instead of 1", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 68, "ChainDef.internalValue has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ChainDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(ChainDef) == 72, "ChainDef has size % instead of 72", size_of(ChainDef));
    }

    {
        info := type_info(Profile);
        for info.members {
            if it.name == {
                case "step";
                    assert(it.offset_in_bytes == 0, "Profile.step has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.step has unexpected size % instead of 4", it.type.runtime_size);
                case "pairs";
                    assert(it.offset_in_bytes == 4, "Profile.pairs has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.pairs has unexpected size % instead of 4", it.type.runtime_size);
                case "collide";
                    assert(it.offset_in_bytes == 8, "Profile.collide has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.collide has unexpected size % instead of 4", it.type.runtime_size);
                case "solve";
                    assert(it.offset_in_bytes == 12, "Profile.solve has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.solve has unexpected size % instead of 4", it.type.runtime_size);
                case "mergeIslands";
                    assert(it.offset_in_bytes == 16, "Profile.mergeIslands has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.mergeIslands has unexpected size % instead of 4", it.type.runtime_size);
                case "prepareStages";
                    assert(it.offset_in_bytes == 20, "Profile.prepareStages has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.prepareStages has unexpected size % instead of 4", it.type.runtime_size);
                case "solveConstraints";
                    assert(it.offset_in_bytes == 24, "Profile.solveConstraints has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.solveConstraints has unexpected size % instead of 4", it.type.runtime_size);
                case "prepareConstraints";
                    assert(it.offset_in_bytes == 28, "Profile.prepareConstraints has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.prepareConstraints has unexpected size % instead of 4", it.type.runtime_size);
                case "integrateVelocities";
                    assert(it.offset_in_bytes == 32, "Profile.integrateVelocities has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.integrateVelocities has unexpected size % instead of 4", it.type.runtime_size);
                case "warmStart";
                    assert(it.offset_in_bytes == 36, "Profile.warmStart has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.warmStart has unexpected size % instead of 4", it.type.runtime_size);
                case "solveImpulses";
                    assert(it.offset_in_bytes == 40, "Profile.solveImpulses has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.solveImpulses has unexpected size % instead of 4", it.type.runtime_size);
                case "integratePositions";
                    assert(it.offset_in_bytes == 44, "Profile.integratePositions has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.integratePositions has unexpected size % instead of 4", it.type.runtime_size);
                case "relaxImpulses";
                    assert(it.offset_in_bytes == 48, "Profile.relaxImpulses has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.relaxImpulses has unexpected size % instead of 4", it.type.runtime_size);
                case "applyRestitution";
                    assert(it.offset_in_bytes == 52, "Profile.applyRestitution has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.applyRestitution has unexpected size % instead of 4", it.type.runtime_size);
                case "storeImpulses";
                    assert(it.offset_in_bytes == 56, "Profile.storeImpulses has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.storeImpulses has unexpected size % instead of 4", it.type.runtime_size);
                case "splitIslands";
                    assert(it.offset_in_bytes == 60, "Profile.splitIslands has unexpected offset % instead of 60", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.splitIslands has unexpected size % instead of 4", it.type.runtime_size);
                case "transforms";
                    assert(it.offset_in_bytes == 64, "Profile.transforms has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.transforms has unexpected size % instead of 4", it.type.runtime_size);
                case "hitEvents";
                    assert(it.offset_in_bytes == 68, "Profile.hitEvents has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.hitEvents has unexpected size % instead of 4", it.type.runtime_size);
                case "refit";
                    assert(it.offset_in_bytes == 72, "Profile.refit has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.refit has unexpected size % instead of 4", it.type.runtime_size);
                case "bullets";
                    assert(it.offset_in_bytes == 76, "Profile.bullets has unexpected offset % instead of 76", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.bullets has unexpected size % instead of 4", it.type.runtime_size);
                case "sleepIslands";
                    assert(it.offset_in_bytes == 80, "Profile.sleepIslands has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.sleepIslands has unexpected size % instead of 4", it.type.runtime_size);
                case "sensors";
                    assert(it.offset_in_bytes == 84, "Profile.sensors has unexpected offset % instead of 84", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Profile.sensors has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(Profile) == 88, "Profile has size % instead of 88", size_of(Profile));
    }

    {
        info := type_info(Counters);
        for info.members {
            if it.name == {
                case "bodyCount";
                    assert(it.offset_in_bytes == 0, "Counters.bodyCount has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.bodyCount has unexpected size % instead of 4", it.type.runtime_size);
                case "shapeCount";
                    assert(it.offset_in_bytes == 4, "Counters.shapeCount has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.shapeCount has unexpected size % instead of 4", it.type.runtime_size);
                case "contactCount";
                    assert(it.offset_in_bytes == 8, "Counters.contactCount has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.contactCount has unexpected size % instead of 4", it.type.runtime_size);
                case "jointCount";
                    assert(it.offset_in_bytes == 12, "Counters.jointCount has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.jointCount has unexpected size % instead of 4", it.type.runtime_size);
                case "islandCount";
                    assert(it.offset_in_bytes == 16, "Counters.islandCount has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.islandCount has unexpected size % instead of 4", it.type.runtime_size);
                case "stackUsed";
                    assert(it.offset_in_bytes == 20, "Counters.stackUsed has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.stackUsed has unexpected size % instead of 4", it.type.runtime_size);
                case "staticTreeHeight";
                    assert(it.offset_in_bytes == 24, "Counters.staticTreeHeight has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.staticTreeHeight has unexpected size % instead of 4", it.type.runtime_size);
                case "treeHeight";
                    assert(it.offset_in_bytes == 28, "Counters.treeHeight has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.treeHeight has unexpected size % instead of 4", it.type.runtime_size);
                case "byteCount";
                    assert(it.offset_in_bytes == 32, "Counters.byteCount has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.byteCount has unexpected size % instead of 4", it.type.runtime_size);
                case "taskCount";
                    assert(it.offset_in_bytes == 36, "Counters.taskCount has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "Counters.taskCount has unexpected size % instead of 4", it.type.runtime_size);
                case "colorCounts";
                    assert(it.offset_in_bytes == 40, "Counters.colorCounts has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 48, "Counters.colorCounts has unexpected size % instead of 48", it.type.runtime_size);
            }
        }
        assert(size_of(Counters) == 88, "Counters has size % instead of 88", size_of(Counters));
    }

    {
        info := type_info(DistanceJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "DistanceJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "DistanceJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorA";
                    assert(it.offset_in_bytes == 16, "DistanceJointDef.localAnchorA has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceJointDef.localAnchorA has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorB";
                    assert(it.offset_in_bytes == 24, "DistanceJointDef.localAnchorB has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceJointDef.localAnchorB has unexpected size % instead of 8", it.type.runtime_size);
                case "length";
                    assert(it.offset_in_bytes == 32, "DistanceJointDef.length has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.length has unexpected size % instead of 4", it.type.runtime_size);
                case "enableSpring";
                    assert(it.offset_in_bytes == 36, "DistanceJointDef.enableSpring has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DistanceJointDef.enableSpring has unexpected size % instead of 1", it.type.runtime_size);
                case "hertz";
                    assert(it.offset_in_bytes == 40, "DistanceJointDef.hertz has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.hertz has unexpected size % instead of 4", it.type.runtime_size);
                case "dampingRatio";
                    assert(it.offset_in_bytes == 44, "DistanceJointDef.dampingRatio has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.dampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "enableLimit";
                    assert(it.offset_in_bytes == 48, "DistanceJointDef.enableLimit has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DistanceJointDef.enableLimit has unexpected size % instead of 1", it.type.runtime_size);
                case "minLength";
                    assert(it.offset_in_bytes == 52, "DistanceJointDef.minLength has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.minLength has unexpected size % instead of 4", it.type.runtime_size);
                case "maxLength";
                    assert(it.offset_in_bytes == 56, "DistanceJointDef.maxLength has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.maxLength has unexpected size % instead of 4", it.type.runtime_size);
                case "enableMotor";
                    assert(it.offset_in_bytes == 60, "DistanceJointDef.enableMotor has unexpected offset % instead of 60", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DistanceJointDef.enableMotor has unexpected size % instead of 1", it.type.runtime_size);
                case "maxMotorForce";
                    assert(it.offset_in_bytes == 64, "DistanceJointDef.maxMotorForce has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.maxMotorForce has unexpected size % instead of 4", it.type.runtime_size);
                case "motorSpeed";
                    assert(it.offset_in_bytes == 68, "DistanceJointDef.motorSpeed has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.motorSpeed has unexpected size % instead of 4", it.type.runtime_size);
                case "collideConnected";
                    assert(it.offset_in_bytes == 72, "DistanceJointDef.collideConnected has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DistanceJointDef.collideConnected has unexpected size % instead of 1", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 80, "DistanceJointDef.userData has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DistanceJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 88, "DistanceJointDef.internalValue has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "DistanceJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(DistanceJointDef) == 96, "DistanceJointDef has size % instead of 96", size_of(DistanceJointDef));
    }

    {
        info := type_info(MotorJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "MotorJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MotorJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "MotorJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MotorJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "linearOffset";
                    assert(it.offset_in_bytes == 16, "MotorJointDef.linearOffset has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MotorJointDef.linearOffset has unexpected size % instead of 8", it.type.runtime_size);
                case "angularOffset";
                    assert(it.offset_in_bytes == 24, "MotorJointDef.angularOffset has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MotorJointDef.angularOffset has unexpected size % instead of 4", it.type.runtime_size);
                case "maxForce";
                    assert(it.offset_in_bytes == 28, "MotorJointDef.maxForce has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MotorJointDef.maxForce has unexpected size % instead of 4", it.type.runtime_size);
                case "maxTorque";
                    assert(it.offset_in_bytes == 32, "MotorJointDef.maxTorque has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MotorJointDef.maxTorque has unexpected size % instead of 4", it.type.runtime_size);
                case "correctionFactor";
                    assert(it.offset_in_bytes == 36, "MotorJointDef.correctionFactor has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MotorJointDef.correctionFactor has unexpected size % instead of 4", it.type.runtime_size);
                case "collideConnected";
                    assert(it.offset_in_bytes == 40, "MotorJointDef.collideConnected has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "MotorJointDef.collideConnected has unexpected size % instead of 1", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 48, "MotorJointDef.userData has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MotorJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 56, "MotorJointDef.internalValue has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MotorJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(MotorJointDef) == 64, "MotorJointDef has size % instead of 64", size_of(MotorJointDef));
    }

    {
        info := type_info(MouseJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "MouseJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MouseJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "MouseJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MouseJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "target";
                    assert(it.offset_in_bytes == 16, "MouseJointDef.target has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MouseJointDef.target has unexpected size % instead of 8", it.type.runtime_size);
                case "hertz";
                    assert(it.offset_in_bytes == 24, "MouseJointDef.hertz has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MouseJointDef.hertz has unexpected size % instead of 4", it.type.runtime_size);
                case "dampingRatio";
                    assert(it.offset_in_bytes == 28, "MouseJointDef.dampingRatio has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MouseJointDef.dampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "maxForce";
                    assert(it.offset_in_bytes == 32, "MouseJointDef.maxForce has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MouseJointDef.maxForce has unexpected size % instead of 4", it.type.runtime_size);
                case "collideConnected";
                    assert(it.offset_in_bytes == 36, "MouseJointDef.collideConnected has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "MouseJointDef.collideConnected has unexpected size % instead of 1", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 40, "MouseJointDef.userData has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "MouseJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 48, "MouseJointDef.internalValue has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "MouseJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(MouseJointDef) == 56, "MouseJointDef has size % instead of 56", size_of(MouseJointDef));
    }

    {
        info := type_info(FilterJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "FilterJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "FilterJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "FilterJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "FilterJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 16, "FilterJointDef.userData has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "FilterJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 24, "FilterJointDef.internalValue has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "FilterJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(FilterJointDef) == 32, "FilterJointDef has size % instead of 32", size_of(FilterJointDef));
    }

    {
        info := type_info(PrismaticJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "PrismaticJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PrismaticJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "PrismaticJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PrismaticJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorA";
                    assert(it.offset_in_bytes == 16, "PrismaticJointDef.localAnchorA has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PrismaticJointDef.localAnchorA has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorB";
                    assert(it.offset_in_bytes == 24, "PrismaticJointDef.localAnchorB has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PrismaticJointDef.localAnchorB has unexpected size % instead of 8", it.type.runtime_size);
                case "localAxisA";
                    assert(it.offset_in_bytes == 32, "PrismaticJointDef.localAxisA has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PrismaticJointDef.localAxisA has unexpected size % instead of 8", it.type.runtime_size);
                case "referenceAngle";
                    assert(it.offset_in_bytes == 40, "PrismaticJointDef.referenceAngle has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.referenceAngle has unexpected size % instead of 4", it.type.runtime_size);
                case "targetTranslation";
                    assert(it.offset_in_bytes == 44, "PrismaticJointDef.targetTranslation has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.targetTranslation has unexpected size % instead of 4", it.type.runtime_size);
                case "enableSpring";
                    assert(it.offset_in_bytes == 48, "PrismaticJointDef.enableSpring has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "PrismaticJointDef.enableSpring has unexpected size % instead of 1", it.type.runtime_size);
                case "hertz";
                    assert(it.offset_in_bytes == 52, "PrismaticJointDef.hertz has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.hertz has unexpected size % instead of 4", it.type.runtime_size);
                case "dampingRatio";
                    assert(it.offset_in_bytes == 56, "PrismaticJointDef.dampingRatio has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.dampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "enableLimit";
                    assert(it.offset_in_bytes == 60, "PrismaticJointDef.enableLimit has unexpected offset % instead of 60", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "PrismaticJointDef.enableLimit has unexpected size % instead of 1", it.type.runtime_size);
                case "lowerTranslation";
                    assert(it.offset_in_bytes == 64, "PrismaticJointDef.lowerTranslation has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.lowerTranslation has unexpected size % instead of 4", it.type.runtime_size);
                case "upperTranslation";
                    assert(it.offset_in_bytes == 68, "PrismaticJointDef.upperTranslation has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.upperTranslation has unexpected size % instead of 4", it.type.runtime_size);
                case "enableMotor";
                    assert(it.offset_in_bytes == 72, "PrismaticJointDef.enableMotor has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "PrismaticJointDef.enableMotor has unexpected size % instead of 1", it.type.runtime_size);
                case "maxMotorForce";
                    assert(it.offset_in_bytes == 76, "PrismaticJointDef.maxMotorForce has unexpected offset % instead of 76", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.maxMotorForce has unexpected size % instead of 4", it.type.runtime_size);
                case "motorSpeed";
                    assert(it.offset_in_bytes == 80, "PrismaticJointDef.motorSpeed has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.motorSpeed has unexpected size % instead of 4", it.type.runtime_size);
                case "collideConnected";
                    assert(it.offset_in_bytes == 84, "PrismaticJointDef.collideConnected has unexpected offset % instead of 84", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "PrismaticJointDef.collideConnected has unexpected size % instead of 1", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 88, "PrismaticJointDef.userData has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "PrismaticJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 96, "PrismaticJointDef.internalValue has unexpected offset % instead of 96", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "PrismaticJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(PrismaticJointDef) == 104, "PrismaticJointDef has size % instead of 104", size_of(PrismaticJointDef));
    }

    {
        info := type_info(RevoluteJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "RevoluteJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RevoluteJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "RevoluteJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RevoluteJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorA";
                    assert(it.offset_in_bytes == 16, "RevoluteJointDef.localAnchorA has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RevoluteJointDef.localAnchorA has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorB";
                    assert(it.offset_in_bytes == 24, "RevoluteJointDef.localAnchorB has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RevoluteJointDef.localAnchorB has unexpected size % instead of 8", it.type.runtime_size);
                case "referenceAngle";
                    assert(it.offset_in_bytes == 32, "RevoluteJointDef.referenceAngle has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.referenceAngle has unexpected size % instead of 4", it.type.runtime_size);
                case "targetAngle";
                    assert(it.offset_in_bytes == 36, "RevoluteJointDef.targetAngle has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.targetAngle has unexpected size % instead of 4", it.type.runtime_size);
                case "enableSpring";
                    assert(it.offset_in_bytes == 40, "RevoluteJointDef.enableSpring has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "RevoluteJointDef.enableSpring has unexpected size % instead of 1", it.type.runtime_size);
                case "hertz";
                    assert(it.offset_in_bytes == 44, "RevoluteJointDef.hertz has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.hertz has unexpected size % instead of 4", it.type.runtime_size);
                case "dampingRatio";
                    assert(it.offset_in_bytes == 48, "RevoluteJointDef.dampingRatio has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.dampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "enableLimit";
                    assert(it.offset_in_bytes == 52, "RevoluteJointDef.enableLimit has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "RevoluteJointDef.enableLimit has unexpected size % instead of 1", it.type.runtime_size);
                case "lowerAngle";
                    assert(it.offset_in_bytes == 56, "RevoluteJointDef.lowerAngle has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.lowerAngle has unexpected size % instead of 4", it.type.runtime_size);
                case "upperAngle";
                    assert(it.offset_in_bytes == 60, "RevoluteJointDef.upperAngle has unexpected offset % instead of 60", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.upperAngle has unexpected size % instead of 4", it.type.runtime_size);
                case "enableMotor";
                    assert(it.offset_in_bytes == 64, "RevoluteJointDef.enableMotor has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "RevoluteJointDef.enableMotor has unexpected size % instead of 1", it.type.runtime_size);
                case "maxMotorTorque";
                    assert(it.offset_in_bytes == 68, "RevoluteJointDef.maxMotorTorque has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.maxMotorTorque has unexpected size % instead of 4", it.type.runtime_size);
                case "motorSpeed";
                    assert(it.offset_in_bytes == 72, "RevoluteJointDef.motorSpeed has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.motorSpeed has unexpected size % instead of 4", it.type.runtime_size);
                case "drawSize";
                    assert(it.offset_in_bytes == 76, "RevoluteJointDef.drawSize has unexpected offset % instead of 76", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.drawSize has unexpected size % instead of 4", it.type.runtime_size);
                case "collideConnected";
                    assert(it.offset_in_bytes == 80, "RevoluteJointDef.collideConnected has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "RevoluteJointDef.collideConnected has unexpected size % instead of 1", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 88, "RevoluteJointDef.userData has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "RevoluteJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 96, "RevoluteJointDef.internalValue has unexpected offset % instead of 96", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "RevoluteJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(RevoluteJointDef) == 104, "RevoluteJointDef has size % instead of 104", size_of(RevoluteJointDef));
    }

    {
        info := type_info(WeldJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "WeldJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WeldJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "WeldJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WeldJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorA";
                    assert(it.offset_in_bytes == 16, "WeldJointDef.localAnchorA has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WeldJointDef.localAnchorA has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorB";
                    assert(it.offset_in_bytes == 24, "WeldJointDef.localAnchorB has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WeldJointDef.localAnchorB has unexpected size % instead of 8", it.type.runtime_size);
                case "referenceAngle";
                    assert(it.offset_in_bytes == 32, "WeldJointDef.referenceAngle has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WeldJointDef.referenceAngle has unexpected size % instead of 4", it.type.runtime_size);
                case "linearHertz";
                    assert(it.offset_in_bytes == 36, "WeldJointDef.linearHertz has unexpected offset % instead of 36", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WeldJointDef.linearHertz has unexpected size % instead of 4", it.type.runtime_size);
                case "angularHertz";
                    assert(it.offset_in_bytes == 40, "WeldJointDef.angularHertz has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WeldJointDef.angularHertz has unexpected size % instead of 4", it.type.runtime_size);
                case "linearDampingRatio";
                    assert(it.offset_in_bytes == 44, "WeldJointDef.linearDampingRatio has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WeldJointDef.linearDampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "angularDampingRatio";
                    assert(it.offset_in_bytes == 48, "WeldJointDef.angularDampingRatio has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WeldJointDef.angularDampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "collideConnected";
                    assert(it.offset_in_bytes == 52, "WeldJointDef.collideConnected has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "WeldJointDef.collideConnected has unexpected size % instead of 1", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 56, "WeldJointDef.userData has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WeldJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 64, "WeldJointDef.internalValue has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WeldJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(WeldJointDef) == 72, "WeldJointDef has size % instead of 72", size_of(WeldJointDef));
    }

    {
        info := type_info(WheelJointDef);
        for info.members {
            if it.name == {
                case "bodyIdA";
                    assert(it.offset_in_bytes == 0, "WheelJointDef.bodyIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WheelJointDef.bodyIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "bodyIdB";
                    assert(it.offset_in_bytes == 8, "WheelJointDef.bodyIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WheelJointDef.bodyIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorA";
                    assert(it.offset_in_bytes == 16, "WheelJointDef.localAnchorA has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WheelJointDef.localAnchorA has unexpected size % instead of 8", it.type.runtime_size);
                case "localAnchorB";
                    assert(it.offset_in_bytes == 24, "WheelJointDef.localAnchorB has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WheelJointDef.localAnchorB has unexpected size % instead of 8", it.type.runtime_size);
                case "localAxisA";
                    assert(it.offset_in_bytes == 32, "WheelJointDef.localAxisA has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WheelJointDef.localAxisA has unexpected size % instead of 8", it.type.runtime_size);
                case "enableSpring";
                    assert(it.offset_in_bytes == 40, "WheelJointDef.enableSpring has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "WheelJointDef.enableSpring has unexpected size % instead of 1", it.type.runtime_size);
                case "hertz";
                    assert(it.offset_in_bytes == 44, "WheelJointDef.hertz has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WheelJointDef.hertz has unexpected size % instead of 4", it.type.runtime_size);
                case "dampingRatio";
                    assert(it.offset_in_bytes == 48, "WheelJointDef.dampingRatio has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WheelJointDef.dampingRatio has unexpected size % instead of 4", it.type.runtime_size);
                case "enableLimit";
                    assert(it.offset_in_bytes == 52, "WheelJointDef.enableLimit has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "WheelJointDef.enableLimit has unexpected size % instead of 1", it.type.runtime_size);
                case "lowerTranslation";
                    assert(it.offset_in_bytes == 56, "WheelJointDef.lowerTranslation has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WheelJointDef.lowerTranslation has unexpected size % instead of 4", it.type.runtime_size);
                case "upperTranslation";
                    assert(it.offset_in_bytes == 60, "WheelJointDef.upperTranslation has unexpected offset % instead of 60", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WheelJointDef.upperTranslation has unexpected size % instead of 4", it.type.runtime_size);
                case "enableMotor";
                    assert(it.offset_in_bytes == 64, "WheelJointDef.enableMotor has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "WheelJointDef.enableMotor has unexpected size % instead of 1", it.type.runtime_size);
                case "maxMotorTorque";
                    assert(it.offset_in_bytes == 68, "WheelJointDef.maxMotorTorque has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WheelJointDef.maxMotorTorque has unexpected size % instead of 4", it.type.runtime_size);
                case "motorSpeed";
                    assert(it.offset_in_bytes == 72, "WheelJointDef.motorSpeed has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WheelJointDef.motorSpeed has unexpected size % instead of 4", it.type.runtime_size);
                case "collideConnected";
                    assert(it.offset_in_bytes == 76, "WheelJointDef.collideConnected has unexpected offset % instead of 76", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "WheelJointDef.collideConnected has unexpected size % instead of 1", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 80, "WheelJointDef.userData has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "WheelJointDef.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "internalValue";
                    assert(it.offset_in_bytes == 88, "WheelJointDef.internalValue has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "WheelJointDef.internalValue has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(WheelJointDef) == 96, "WheelJointDef has size % instead of 96", size_of(WheelJointDef));
    }

    {
        info := type_info(ExplosionDef);
        for info.members {
            if it.name == {
                case "maskBits";
                    assert(it.offset_in_bytes == 0, "ExplosionDef.maskBits has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ExplosionDef.maskBits has unexpected size % instead of 8", it.type.runtime_size);
                case "position";
                    assert(it.offset_in_bytes == 8, "ExplosionDef.position has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ExplosionDef.position has unexpected size % instead of 8", it.type.runtime_size);
                case "radius";
                    assert(it.offset_in_bytes == 16, "ExplosionDef.radius has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ExplosionDef.radius has unexpected size % instead of 4", it.type.runtime_size);
                case "falloff";
                    assert(it.offset_in_bytes == 20, "ExplosionDef.falloff has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ExplosionDef.falloff has unexpected size % instead of 4", it.type.runtime_size);
                case "impulsePerLength";
                    assert(it.offset_in_bytes == 24, "ExplosionDef.impulsePerLength has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ExplosionDef.impulsePerLength has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(ExplosionDef) == 32, "ExplosionDef has size % instead of 32", size_of(ExplosionDef));
    }

    {
        info := type_info(SensorBeginTouchEvent);
        for info.members {
            if it.name == {
                case "sensorShapeId";
                    assert(it.offset_in_bytes == 0, "SensorBeginTouchEvent.sensorShapeId has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SensorBeginTouchEvent.sensorShapeId has unexpected size % instead of 8", it.type.runtime_size);
                case "visitorShapeId";
                    assert(it.offset_in_bytes == 8, "SensorBeginTouchEvent.visitorShapeId has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SensorBeginTouchEvent.visitorShapeId has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(SensorBeginTouchEvent) == 16, "SensorBeginTouchEvent has size % instead of 16", size_of(SensorBeginTouchEvent));
    }

    {
        info := type_info(SensorEndTouchEvent);
        for info.members {
            if it.name == {
                case "sensorShapeId";
                    assert(it.offset_in_bytes == 0, "SensorEndTouchEvent.sensorShapeId has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SensorEndTouchEvent.sensorShapeId has unexpected size % instead of 8", it.type.runtime_size);
                case "visitorShapeId";
                    assert(it.offset_in_bytes == 8, "SensorEndTouchEvent.visitorShapeId has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SensorEndTouchEvent.visitorShapeId has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(SensorEndTouchEvent) == 16, "SensorEndTouchEvent has size % instead of 16", size_of(SensorEndTouchEvent));
    }

    {
        info := type_info(SensorEvents);
        for info.members {
            if it.name == {
                case "beginEvents";
                    assert(it.offset_in_bytes == 0, "SensorEvents.beginEvents has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SensorEvents.beginEvents has unexpected size % instead of 8", it.type.runtime_size);
                case "endEvents";
                    assert(it.offset_in_bytes == 8, "SensorEvents.endEvents has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "SensorEvents.endEvents has unexpected size % instead of 8", it.type.runtime_size);
                case "beginCount";
                    assert(it.offset_in_bytes == 16, "SensorEvents.beginCount has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SensorEvents.beginCount has unexpected size % instead of 4", it.type.runtime_size);
                case "endCount";
                    assert(it.offset_in_bytes == 20, "SensorEvents.endCount has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "SensorEvents.endCount has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(SensorEvents) == 24, "SensorEvents has size % instead of 24", size_of(SensorEvents));
    }

    {
        info := type_info(ContactBeginTouchEvent);
        for info.members {
            if it.name == {
                case "shapeIdA";
                    assert(it.offset_in_bytes == 0, "ContactBeginTouchEvent.shapeIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactBeginTouchEvent.shapeIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "shapeIdB";
                    assert(it.offset_in_bytes == 8, "ContactBeginTouchEvent.shapeIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactBeginTouchEvent.shapeIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "manifold";
                    assert(it.offset_in_bytes == 16, "ContactBeginTouchEvent.manifold has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 112, "ContactBeginTouchEvent.manifold has unexpected size % instead of 112", it.type.runtime_size);
            }
        }
        assert(size_of(ContactBeginTouchEvent) == 128, "ContactBeginTouchEvent has size % instead of 128", size_of(ContactBeginTouchEvent));
    }

    {
        info := type_info(ContactEndTouchEvent);
        for info.members {
            if it.name == {
                case "shapeIdA";
                    assert(it.offset_in_bytes == 0, "ContactEndTouchEvent.shapeIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactEndTouchEvent.shapeIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "shapeIdB";
                    assert(it.offset_in_bytes == 8, "ContactEndTouchEvent.shapeIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactEndTouchEvent.shapeIdB has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(ContactEndTouchEvent) == 16, "ContactEndTouchEvent has size % instead of 16", size_of(ContactEndTouchEvent));
    }

    {
        info := type_info(ContactHitEvent);
        for info.members {
            if it.name == {
                case "shapeIdA";
                    assert(it.offset_in_bytes == 0, "ContactHitEvent.shapeIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactHitEvent.shapeIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "shapeIdB";
                    assert(it.offset_in_bytes == 8, "ContactHitEvent.shapeIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactHitEvent.shapeIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "point";
                    assert(it.offset_in_bytes == 16, "ContactHitEvent.point has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactHitEvent.point has unexpected size % instead of 8", it.type.runtime_size);
                case "normal";
                    assert(it.offset_in_bytes == 24, "ContactHitEvent.normal has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactHitEvent.normal has unexpected size % instead of 8", it.type.runtime_size);
                case "approachSpeed";
                    assert(it.offset_in_bytes == 32, "ContactHitEvent.approachSpeed has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ContactHitEvent.approachSpeed has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(ContactHitEvent) == 36, "ContactHitEvent has size % instead of 36", size_of(ContactHitEvent));
    }

    {
        info := type_info(ContactEvents);
        for info.members {
            if it.name == {
                case "beginEvents";
                    assert(it.offset_in_bytes == 0, "ContactEvents.beginEvents has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactEvents.beginEvents has unexpected size % instead of 8", it.type.runtime_size);
                case "endEvents";
                    assert(it.offset_in_bytes == 8, "ContactEvents.endEvents has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactEvents.endEvents has unexpected size % instead of 8", it.type.runtime_size);
                case "hitEvents";
                    assert(it.offset_in_bytes == 16, "ContactEvents.hitEvents has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactEvents.hitEvents has unexpected size % instead of 8", it.type.runtime_size);
                case "beginCount";
                    assert(it.offset_in_bytes == 24, "ContactEvents.beginCount has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ContactEvents.beginCount has unexpected size % instead of 4", it.type.runtime_size);
                case "endCount";
                    assert(it.offset_in_bytes == 28, "ContactEvents.endCount has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ContactEvents.endCount has unexpected size % instead of 4", it.type.runtime_size);
                case "hitCount";
                    assert(it.offset_in_bytes == 32, "ContactEvents.hitCount has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "ContactEvents.hitCount has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(ContactEvents) == 40, "ContactEvents has size % instead of 40", size_of(ContactEvents));
    }

    {
        info := type_info(BodyMoveEvent);
        for info.members {
            if it.name == {
                case "transform";
                    assert(it.offset_in_bytes == 0, "BodyMoveEvent.transform has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "BodyMoveEvent.transform has unexpected size % instead of 16", it.type.runtime_size);
                case "bodyId";
                    assert(it.offset_in_bytes == 16, "BodyMoveEvent.bodyId has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyMoveEvent.bodyId has unexpected size % instead of 8", it.type.runtime_size);
                case "userData";
                    assert(it.offset_in_bytes == 24, "BodyMoveEvent.userData has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyMoveEvent.userData has unexpected size % instead of 8", it.type.runtime_size);
                case "fellAsleep";
                    assert(it.offset_in_bytes == 32, "BodyMoveEvent.fellAsleep has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "BodyMoveEvent.fellAsleep has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(BodyMoveEvent) == 40, "BodyMoveEvent has size % instead of 40", size_of(BodyMoveEvent));
    }

    {
        info := type_info(BodyEvents);
        for info.members {
            if it.name == {
                case "moveEvents";
                    assert(it.offset_in_bytes == 0, "BodyEvents.moveEvents has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "BodyEvents.moveEvents has unexpected size % instead of 8", it.type.runtime_size);
                case "moveCount";
                    assert(it.offset_in_bytes == 8, "BodyEvents.moveCount has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "BodyEvents.moveCount has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(BodyEvents) == 16, "BodyEvents has size % instead of 16", size_of(BodyEvents));
    }

    {
        info := type_info(ContactData);
        for info.members {
            if it.name == {
                case "shapeIdA";
                    assert(it.offset_in_bytes == 0, "ContactData.shapeIdA has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactData.shapeIdA has unexpected size % instead of 8", it.type.runtime_size);
                case "shapeIdB";
                    assert(it.offset_in_bytes == 8, "ContactData.shapeIdB has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "ContactData.shapeIdB has unexpected size % instead of 8", it.type.runtime_size);
                case "manifold";
                    assert(it.offset_in_bytes == 16, "ContactData.manifold has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 112, "ContactData.manifold has unexpected size % instead of 112", it.type.runtime_size);
            }
        }
        assert(size_of(ContactData) == 128, "ContactData has size % instead of 128", size_of(ContactData));
    }

    {
        info := type_info(DebugDraw);
        for info.members {
            if it.name == {
                case "DrawPolygonFcn";
                    assert(it.offset_in_bytes == 0, "DebugDraw.DrawPolygonFcn has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawPolygonFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawSolidPolygonFcn";
                    assert(it.offset_in_bytes == 8, "DebugDraw.DrawSolidPolygonFcn has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawSolidPolygonFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawCircleFcn";
                    assert(it.offset_in_bytes == 16, "DebugDraw.DrawCircleFcn has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawCircleFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawSolidCircleFcn";
                    assert(it.offset_in_bytes == 24, "DebugDraw.DrawSolidCircleFcn has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawSolidCircleFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawSolidCapsuleFcn";
                    assert(it.offset_in_bytes == 32, "DebugDraw.DrawSolidCapsuleFcn has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawSolidCapsuleFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawSegmentFcn";
                    assert(it.offset_in_bytes == 40, "DebugDraw.DrawSegmentFcn has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawSegmentFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawTransformFcn";
                    assert(it.offset_in_bytes == 48, "DebugDraw.DrawTransformFcn has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawTransformFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawPointFcn";
                    assert(it.offset_in_bytes == 56, "DebugDraw.DrawPointFcn has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawPointFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "DrawStringFcn";
                    assert(it.offset_in_bytes == 64, "DebugDraw.DrawStringFcn has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw.DrawStringFcn has unexpected size % instead of 8", it.type.runtime_size);
                case "drawingBounds";
                    assert(it.offset_in_bytes == 72, "DebugDraw.drawingBounds has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "DebugDraw.drawingBounds has unexpected size % instead of 16", it.type.runtime_size);
                case "useDrawingBounds";
                    assert(it.offset_in_bytes == 88, "DebugDraw.useDrawingBounds has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.useDrawingBounds has unexpected size % instead of 1", it.type.runtime_size);
                case "drawShapes";
                    assert(it.offset_in_bytes == 89, "DebugDraw.drawShapes has unexpected offset % instead of 89", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawShapes has unexpected size % instead of 1", it.type.runtime_size);
                case "drawJoints";
                    assert(it.offset_in_bytes == 90, "DebugDraw.drawJoints has unexpected offset % instead of 90", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawJoints has unexpected size % instead of 1", it.type.runtime_size);
                case "drawJointExtras";
                    assert(it.offset_in_bytes == 91, "DebugDraw.drawJointExtras has unexpected offset % instead of 91", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawJointExtras has unexpected size % instead of 1", it.type.runtime_size);
                case "drawBounds";
                    assert(it.offset_in_bytes == 92, "DebugDraw.drawBounds has unexpected offset % instead of 92", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawBounds has unexpected size % instead of 1", it.type.runtime_size);
                case "drawMass";
                    assert(it.offset_in_bytes == 93, "DebugDraw.drawMass has unexpected offset % instead of 93", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawMass has unexpected size % instead of 1", it.type.runtime_size);
                case "drawBodyNames";
                    assert(it.offset_in_bytes == 94, "DebugDraw.drawBodyNames has unexpected offset % instead of 94", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawBodyNames has unexpected size % instead of 1", it.type.runtime_size);
                case "drawContacts";
                    assert(it.offset_in_bytes == 95, "DebugDraw.drawContacts has unexpected offset % instead of 95", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawContacts has unexpected size % instead of 1", it.type.runtime_size);
                case "drawGraphColors";
                    assert(it.offset_in_bytes == 96, "DebugDraw.drawGraphColors has unexpected offset % instead of 96", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawGraphColors has unexpected size % instead of 1", it.type.runtime_size);
                case "drawContactNormals";
                    assert(it.offset_in_bytes == 97, "DebugDraw.drawContactNormals has unexpected offset % instead of 97", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawContactNormals has unexpected size % instead of 1", it.type.runtime_size);
                case "drawContactImpulses";
                    assert(it.offset_in_bytes == 98, "DebugDraw.drawContactImpulses has unexpected offset % instead of 98", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawContactImpulses has unexpected size % instead of 1", it.type.runtime_size);
                case "drawContactFeatures";
                    assert(it.offset_in_bytes == 99, "DebugDraw.drawContactFeatures has unexpected offset % instead of 99", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawContactFeatures has unexpected size % instead of 1", it.type.runtime_size);
                case "drawFrictionImpulses";
                    assert(it.offset_in_bytes == 100, "DebugDraw.drawFrictionImpulses has unexpected offset % instead of 100", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawFrictionImpulses has unexpected size % instead of 1", it.type.runtime_size);
                case "drawIslands";
                    assert(it.offset_in_bytes == 101, "DebugDraw.drawIslands has unexpected offset % instead of 101", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "DebugDraw.drawIslands has unexpected size % instead of 1", it.type.runtime_size);
                case "_context";
                    assert(it.offset_in_bytes == 104, "DebugDraw._context has unexpected offset % instead of 104", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "DebugDraw._context has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(DebugDraw) == 112, "DebugDraw has size % instead of 112", size_of(DebugDraw));
    }
}

