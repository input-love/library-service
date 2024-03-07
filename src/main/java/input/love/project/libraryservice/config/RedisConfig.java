package input.love.project.libraryservice.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;

/**
 * Конфигурационный класс для работы с Redis.
 */
@Configuration
@RequiredArgsConstructor
public class RedisConfig {

    /**
     * Создает шаблон RedisTemplate для взаимодействия с Redis.
     * Устанавливает фабрику подключений для шаблона RedisTemplate.
     *
     * @return Шаблон RedisTemplate для взаимодействия с Redis.
     */
    @Bean
    public RedisTemplate<String, String> redisTemplate(
            RedisConnectionFactory redisConnectionFactory) {

        RedisTemplate<String, String> template = new RedisTemplate<>();
        template.setConnectionFactory(redisConnectionFactory);
        return template;
    }
}
