-- rag_bdb.`action` definition

CREATE TABLE `action` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '액션ID',
  `action_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '액션타입 (예: 지식검색, 뉴스요약, 번역 등)',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '액션설명',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '액션명',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `created_by` bigint NOT NULL COMMENT '생성자 ID',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성자 성명',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자 ID',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 성명',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_action_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='액션 테이블';


-- rag_bdb.chatbot_archive definition

CREATE TABLE `chatbot_archive` (
  `id` bigint NOT NULL COMMENT '챗봇ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '챗봇명',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '챗봇 활성화 여부',
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '오픈범위(''전사'', ''개인'')',
  `action_id` bigint DEFAULT NULL COMMENT '챗봇액션 ID',
  `action_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '챗봇액션명',
  `base_prompt_id` bigint DEFAULT NULL COMMENT '프롬프트템플릿 ID',
  `base_prompt_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '프롬프트템플릿명',
  `category_id` bigint DEFAULT NULL COMMENT '카테고리ID',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '카테고리명',
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성일시',
  `created_by` bigint DEFAULT NULL COMMENT '생성자 ID',
  `created_by_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '생성자 이름',
  `deleted_at` datetime(6) DEFAULT NULL COMMENT '삭제일시',
  `deleted_by` bigint DEFAULT NULL COMMENT '삭제자 이름',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '챗봇 설명',
  `dictionary_ids_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '사전 ID JSON 목록',
  `frequency_penalty` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `max_tokens` int DEFAULT NULL COMMENT '출력 제어 파라미터',
  `presence_penalty` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `repetition_penalty` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `stop_sequence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '출력 제어 파라미터',
  `stream` bit(1) DEFAULT NULL COMMENT '스트리밍 여부',
  `temperature` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `top_k` int DEFAULT NULL COMMENT '출력 제어 파라미터',
  `top_p` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `icon` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '아이콘 이미지 파일명',
  `keyword_search_weight` float DEFAULT NULL COMMENT '키워드 검색 기반 가중치',
  `knowledge_category_ids_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '지식 카테고리 ID JSON 목록',
  `model_category_id` bigint DEFAULT NULL COMMENT '모델카테고리 ID',
  `model_id` bigint DEFAULT NULL COMMENT '모델 ID',
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '모델명',
  `multi_turn_depth` int DEFAULT NULL COMMENT '멀티턴 깊이',
  `multi_turn_enabled` bit(1) DEFAULT NULL COMMENT '멀티턴 활성화 여부',
  `retrieval_topk` int DEFAULT NULL COMMENT '지식검색용 top-k',
  `semantic_search_weight` float DEFAULT NULL COMMENT '의미 기반 검색 가중치',
  `ui_template_id` bigint DEFAULT NULL COMMENT 'UI 템플릿 ID',
  `ui_template_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'UI 템플릿명',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자 ID',
  `updated_by_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 이름',
  `use_hybrid_search` bit(1) DEFAULT NULL COMMENT '하이브리드 검색 여부',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='챗봇 삭제 이력 테이블';


-- rag_bdb.chatbot_category definition

CREATE TABLE `chatbot_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '챗봇카테고리ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '챗봇카테고리명',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '챗봇 카테고리 설명',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `created_by` bigint NOT NULL COMMENT '생성자 ID',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성자 이름',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자 ID',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 이름',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_chatbot_category_name` (`name`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='챗봇 카테고리 테이블';


-- rag_bdb.prompt_category definition

CREATE TABLE `prompt_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '프롬프트 카테고리ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '프롬프트 카테고리명',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '프롬프트 카테고리 설명',
  `knowledge_type` enum('EXAMPLE','STRUCTURED','SUMMARY') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지식 유형',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `created_by` bigint NOT NULL COMMENT '생성자 ID',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성자 이름',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자 ID',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 이름',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_prompt_category_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='프롬프트 카테고리 테이블';


-- rag_bdb.ui_template definition

CREATE TABLE `ui_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'UI 템플릿ID',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UI 템플릿 타입',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'UI 템플릿명',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT 'UI 템플릿 설명',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `created_by` bigint NOT NULL COMMENT '생성자 ID',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성자 이름',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자 ID',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 이름',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_ui_template_name` (`name`),
  CONSTRAINT `chk_ui_template_type` CHECK ((`type` in (_utf8mb4'GENERAL',_utf8mb4'KNOWLEDGE')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='UI 템플릿 테이블';


-- rag_bdb.base_prompt_template definition

CREATE TABLE `base_prompt_template` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '템플릿ID',
  `category_id` bigint NOT NULL COMMENT '프롬프트 카테고리 ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '템플릿명',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '템플릿 설명',
  `system_prompt` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '시스템 프롬프트',
  `chatbot_prompt` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '유저 프롬프트(챗봇 가이드 프롬프트)',
  `knowledge_prompt` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '지식 프롬프트',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `created_by` bigint NOT NULL COMMENT '생성자 ID',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성자 이름',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자 ID',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 이름',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_base_prompt_template_name` (`name`),
  KEY `FKaobg99blkkbr9bo0t4pdvpi2o` (`category_id`),
  CONSTRAINT `FKaobg99blkkbr9bo0t4pdvpi2o` FOREIGN KEY (`category_id`) REFERENCES `prompt_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='프롬프트 테이블';


-- rag_bdb.chatbot definition

CREATE TABLE `chatbot` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '챗봇ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '챗봇명',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '챗봇 설명',
  `icon` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '아이콘 이미지 파일명',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '챗봇 활성화 여부',
  `visibility` enum('COMPANY','PRIVATE') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '오픈범위(''전사'', ''개인'')',
  `action_id` bigint NOT NULL COMMENT '챗봇액션 ID',
  `category_id` bigint NOT NULL COMMENT '챗봇카테고리 ID',
  `ui_template_id` bigint NOT NULL COMMENT 'UI템플릿 ID',
  `base_prompt_id` bigint NOT NULL COMMENT '프롬프트템플릿 ID',
  `model_category_id` bigint NOT NULL COMMENT '모델카테고리 ID',
  `model_id` bigint NOT NULL COMMENT '모델 ID',
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '모델명',
  `keyword_search_weight` float DEFAULT NULL COMMENT '키워드 검색 가중치',
  `semantic_search_weight` float DEFAULT NULL COMMENT '의미 기반 검색 가중치',
  `use_hybrid_search` bit(1) DEFAULT NULL COMMENT '하이브리드 검색 여부',
  `retrieval_top_k` int DEFAULT NULL COMMENT '지식검색용 top-k',
  `multi_turn_enabled` bit(1) NOT NULL COMMENT '멀티턴 활성화 여부',
  `multi_turn_depth` int NOT NULL COMMENT '멀티턴 깊이',
  `stream` bit(1) DEFAULT NULL COMMENT '스트리밍 여부',
  `temperature` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `top_p` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `top_k` int DEFAULT NULL COMMENT '출력 제어 파라미터',
  `max_tokens` int DEFAULT NULL COMMENT '출력 제어 파라미터',
  `presence_penalty` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `frequency_penalty` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `repetition_penalty` float DEFAULT NULL COMMENT '출력 제어 파라미터',
  `stop_sequence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '출력 제어 파라미터',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `created_by` bigint NOT NULL COMMENT '생성자 ID',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성자 이름',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자 ID',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 이름',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_chatbot_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_category_id` (`category_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_action_id` (`action_id`),
  KEY `idx_base_prompt_id` (`base_prompt_id`),
  KEY `idx_ui_template_id` (`ui_template_id`),
  KEY `idx_visibility` (`visibility`),
  CONSTRAINT `FK3qwj7ax1hldo0diqs442bu6yi` FOREIGN KEY (`category_id`) REFERENCES `chatbot_category` (`id`),
  CONSTRAINT `FK4c39pbcdxe0pdkmgro9lyvkp5` FOREIGN KEY (`ui_template_id`) REFERENCES `ui_template` (`id`),
  CONSTRAINT `FKfirgj503mmkecfo0dgrl4nl07` FOREIGN KEY (`base_prompt_id`) REFERENCES `base_prompt_template` (`id`),
  CONSTRAINT `FKr1asf9yfhk1fqcrshoindvl36` FOREIGN KEY (`action_id`) REFERENCES `action` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='챗봇 테이블';


-- rag_bdb.chatbot_dictionary definition

CREATE TABLE `chatbot_dictionary` (
  `chatbot_id` bigint NOT NULL COMMENT '금지어 사전을 사용한 챗봇ID',
  `dictionary_id` bigint DEFAULT NULL COMMENT '금지어사전ID',
  KEY `FK55vjfwkc0gnwiq7wvd4ed5j27` (`chatbot_id`),
  CONSTRAINT `FK55vjfwkc0gnwiq7wvd4ed5j27` FOREIGN KEY (`chatbot_id`) REFERENCES `chatbot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='챗봇 사전 테이블';



-- rag_bdb.chatbot_knowledge_category definition

CREATE TABLE `chatbot_knowledge_category` (
  `chatbot_id` bigint NOT NULL COMMENT '챗봇ID',
  `knowledge_category_id` bigint NOT NULL COMMENT '지식카테고리ID',
  PRIMARY KEY (`chatbot_id`,`knowledge_category_id`),
  CONSTRAINT `chatbot_knowledge_category_ibfk_1` FOREIGN KEY (`chatbot_id`) REFERENCES `chatbot` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='챗봇 지식 카테고리 테이블';


-- rag_bdb.suggested_question definition

CREATE TABLE `suggested_question` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '추천질문ID',
  `chatbot_id` bigint NOT NULL COMMENT '챗봇ID',
  `enabled` bit(1) NOT NULL COMMENT '활성화 여부',
  `display_order` int NOT NULL COMMENT '노출 순서',
  `question` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '추천질문 내용',
  `created_by` bigint NOT NULL COMMENT '생성일시',
  `created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '생성자',
  `created_at` datetime(6) NOT NULL COMMENT '생성자 이름',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `updated_by` bigint DEFAULT NULL COMMENT '수정자',
  `updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자 이름',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_suggested_question_chatbot_question` (`chatbot_id`,`question`),
  CONSTRAINT `FKopyws5qiht3lsb07j9a8lv3a8` FOREIGN KEY (`chatbot_id`) REFERENCES `chatbot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=459 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='추천 질문 테이블';


-- rag_bdb.chat_window definition

CREATE TABLE `chat_window` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '채팅창ID',
  `chat_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '채팅창 UUID',
  `chatbot_id` bigint DEFAULT NULL COMMENT '챗봇ID',
  `user_id` bigint NOT NULL COMMENT '사용자ID',
  `department_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '부서명',
  `user_emotion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용자 감정상태',
  `user_intent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용자 의도',
  `conversation_end_time` datetime(6) DEFAULT NULL COMMENT '대화 종료 시간',
  `conversation_importance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '대화 중요도',
  `conversation_reference_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '대화 참조 정보',
  `conversation_start_time` datetime(6) DEFAULT NULL COMMENT '대화 시작 시간',
  `conversation_topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '대화 주제',
  `follow_up_action` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '후속 작업 Action',
  `recommendation_history` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '추천 이력',
  `created_at` datetime(6) NOT NULL COMMENT '채팅창 생성일시',
  `deleted_chatbot_id` bigint DEFAULT NULL COMMENT '삭제된 챗봇 ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chat_id` (`chat_id`),
  UNIQUE KEY `uk_chat_window_chat_id` (`chat_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_chatbot_id` (`chatbot_id`),
  CONSTRAINT `FK3w3lob5uoi3eje24pg9mlxmq0` FOREIGN KEY (`chatbot_id`) REFERENCES `chatbot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1030 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='채팅창 이력 테이블';


-- rag_bdb.chat_history definition

CREATE TABLE `chat_history` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '메시지ID',
  `chat_window_id` bigint NOT NULL COMMENT '채팅창ID',
  `user_id` bigint NOT NULL COMMENT '사용자ID',
  `user_message` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '사용자 메세지',
  `chatbot_response` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '챗봇 응답 내용',
  `reference_block` text COLLATE utf8mb4_general_ci COMMENT '참조 문서 마크다운 블록',
  `knowledge_prompt` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '지식 프롬프트',
  `prompt_tokens` int DEFAULT NULL COMMENT '프롬프트 토큰 수',
  `completion_tokens` int DEFAULT NULL COMMENT '완료 토큰 수',
  `total_tokens` int DEFAULT NULL COMMENT '총 토큰 수',
  `department_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '부서코드',
  `department_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '부서명',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '요약',
  `post_processed` bit(1) NOT NULL COMMENT '후처리 여부',
  `previous_message_id` bigint DEFAULT NULL COMMENT '직전 메시지 ID',
  PRIMARY KEY (`id`),
  KEY `idx_chat_window_id` (`chat_window_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_previous_message_id` (`previous_message_id`),
  KEY `idx_post_processed` (`post_processed`),
  CONSTRAINT `FK2lhdna7k3stsutn7x34b0u5as` FOREIGN KEY (`chat_window_id`) REFERENCES `chat_window` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='채팅 메시지 이력 테이블';


-- rag_bdb.feedback definition

CREATE TABLE `feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '피드백ID',
  `chat_history_id` bigint DEFAULT NULL COMMENT '피드백이 달린 메시지ID',
  `like_reward` bit(1) NOT NULL COMMENT '좋아여 여부',
  `dislike_reward` bit(1) NOT NULL COMMENT '싫어요 여부',
  `user_id` bigint NOT NULL COMMENT '사용자ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '사용자 이름',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '피드백 댓글',
  `rating` int NOT NULL COMMENT '5점 척도 점수',
  `created_at` datetime(6) NOT NULL COMMENT '생성일시',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `is_processed` bit(1) NOT NULL COMMENT '피드백 처리 여부',
  `processed_at` datetime(6) DEFAULT NULL COMMENT '피드백 처리 일시',
  `processed_by` bigint DEFAULT NULL COMMENT '피드백 처리 담당자ID',
  `processed_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '피드백 처리 담당자 이름',
  `processed_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '피드백 처리 코멘트',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_feedback_chat_history_user` (`chat_history_id`,`user_id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_rating` (`rating`),
  KEY `idx_is_processed` (`is_processed`),
  KEY `idx_chat_history_id` (`chat_history_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_chat_history_id_created_at` (`chat_history_id`,`created_at`),
  KEY `idx_processed_at` (`processed_at`),
  CONSTRAINT `fk_feedback_chat_history` FOREIGN KEY (`chat_history_id`) REFERENCES `chat_history` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='피드백 테이블';


