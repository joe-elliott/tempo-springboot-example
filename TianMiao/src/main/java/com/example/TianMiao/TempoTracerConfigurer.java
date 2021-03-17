package com.example.TianMiao;

import io.opentelemetry.sdk.autoconfigure.spi.SdkTracerProviderConfigurer;
import io.opentelemetry.sdk.extension.aws.trace.AwsXrayIdGenerator;
import io.opentelemetry.sdk.trace.SdkTracerProviderBuilder;

public class TempoTracerConfigurer implements SdkTracerProviderConfigurer {
  @Override
  public void configure(SdkTracerProviderBuilder sdkTracerProviderBuilder) {
    sdkTracerProviderBuilder.setIdGenerator(AwsXrayIdGenerator.getInstance());
  }
}