# Game Dev Guides and References

## Unity

### Lerp
```csharp
IEnumerator Lerp()
{
  float duration
  float timeElapsed = 0;
  float t = time / duration;
  
  // Smooth Step
  t = t * t * (3f - 2f * t);

  while (timeElapsed < duration)
  {
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
