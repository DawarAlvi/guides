# Game Dev Guides and References

## Unity

### Lerp
```csharp
IEnumerator Lerp() {
  float duration
  float timeElapsed = 0;
  float t = time / duration;
  
  // Smooth Step
  t = t * t * (3f - 2f * t);

  while (timeElapsed < duration) {
    valueToLerp = Mathf.Lerp(startValue, endValue, t);
    timeElapsed += Time.deltaTime;

    yield return null;
  }
  valueToLerp = endValue;
}
```

### Remap / Map Range
If you have number x in the range [a,b] and you want to transform them to number y in the range [c,d] you need to do this:
```csharp
y = (x − a) * ((d − c) / (b − a)) + c
```
You can do it in Unity using Lerp and Inverse Lerp:
```csharp
y = Mathf.Lerp(c, d, (Mathf.InverseLerp(a, b, x))
```

### Bezier Curve

```csharp
public float duration;
public Transform tStart, tEnd, tApex;

// Method #1: Use in update
void Update() {
    float t = Mathf.PingPong((Time.time / duration), 1);
    transform.position = CalculatePositionOnBCurve(tStart.position, tApex.position, tEnd.position, t);
}

// Method #2: Use in coroutine
IEnumerator StartMotionAlongBCurve() {
    float t = 0;
    while (t <= duration) {
        transform.position = CalculatePositionOnBCurve(tStart.position, tApex.position, tEnd.position, t);
        t += Time.deltaTime;
        yield return null;
    }
}

Vector3 CalculatePositionOnBCurve(Vector3 start, Vector3 apex, Vector3 end, float t) {
    return Vector3.Lerp(Vector3.Lerp(start, apex, t), Vector3.Lerp(apex, end, t), t);
}
```

### Attach an object by an attachment point
```csharp
void Attach(Transform item, Transform socket, string attachmentPointName) {
  Transform attachmentPoint = item.Find(attachmentPointName);
  if (attachementPoint == null) return;
  
  item.SetParent(socket);
  item.localRotation = Quaternion.identity;
  item.localPosition = Vector3.zero;

  item.localRotation = Quaternion.Inverse(attachmentPoint.rotation) * socket.rotation;
  item.localPosition = -socket.InverseTransformPoint(attachmentPoint.position);
}
```
