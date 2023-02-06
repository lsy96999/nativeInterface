package yun.seong.lim.nativeinterfacebck.nativeinterfacebck;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.reactive.function.server.RequestPredicates;
import org.springframework.web.reactive.function.server.RouterFunction;
import org.springframework.web.reactive.function.server.RouterFunctions;
import org.springframework.web.reactive.function.server.ServerResponse;

@Configuration
@RequiredArgsConstructor
public class SampleRouters {
	private final SampleHandlers sampleHandlers;

	@Bean
	public RouterFunction<ServerResponse> sample(){
		return RouterFunctions.route(RequestPredicates.GET("/sample"), sampleHandlers::sample);
	}
}
