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
