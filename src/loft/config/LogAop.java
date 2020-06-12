package loft.config;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LogAop
{
  @Around("within(loft.service..*)")
  public Object loggerAop(ProceedingJoinPoint joinpoint)
    throws Throwable
  {
    String signatureStr = joinpoint.getSignature().toShortString();
    System.out.println(signatureStr + " is start.");
    long st = System.currentTimeMillis();
    try
    {
      Object obj = joinpoint.proceed();
      Object localObject2 = obj;
      long et;
      return localObject2;
    } finally {
      long et = System.currentTimeMillis();
      System.out.println(signatureStr + " is finished.");
      System.out.println(signatureStr + " what ?: " + (et - st));
    }
    
  }
}