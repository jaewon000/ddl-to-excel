-- rag_mdb.apireg_category definition

CREATE TABLE `apireg_category` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Service API 카테고리 ID',
  `provider` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '지원 API(Azure OpenAI Service / OpenAI ChatGPT)',
  `type` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '모델 타입 구분을 위한 콜럼값: MODELFILE/API\n실제 모델파일(Gemma, Llama, ...) 는 1:1 맵핑이지만\nAPI (ChatGPT, ...) 는 여러개의 모델이 생성이 가능함.\n',
  `initial_setting` longtext COLLATE utf8mb4_general_ci COMMENT '모델별 모델설정 초기값 (key, value) JSON 문자열을 String 화 한 값. modelsetting 을 위한 조회 값',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='API 방식으로 모델 생성시 필요한 모델의 카테고리';


-- rag_mdb.model_batch_job definition

CREATE TABLE `model_batch_job` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `m_id` bigint NOT NULL COMMENT '모델 ID',
  `m_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '모델명',
  `batch_id` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '배치 아이디',
  `batch_status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '베치 결과값',
  `model_status_from` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '변경전 모델 상태값',
  `model_status_to` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '변경후 모델 상태값',
  `message` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '메세지',
  `created_at` datetime(6) DEFAULT NULL COMMENT '배치 생성 시간',
  `executed_at` datetime(6) DEFAULT NULL COMMENT '배치 실행 시간',
  `ended_at` datetime(6) DEFAULT NULL COMMENT '배치 끝난 시간',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK4yscktfl3y3b7o5qg6xlbq6j3` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='모델 야간배치를 위한 테이블\r\n0.5 버전에서는 사용하고 있지 않음';


-- rag_mdb.model_category definition

CREATE TABLE `model_category` (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '모델 카테고리 ID',
  `category_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '모델 카테고리 이름',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `UK3nox6f7lqfcfm9s2i1lut1d6h` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='모델 카테고리 테이블';


-- rag_mdb.model_file definition

CREATE TABLE `model_file` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '모델 파일 카테고리 ID',
  `model_category_id` bigint NOT NULL COMMENT '모델 카테고리 아이디',
  `display_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '노출되는 모델 파일 이름 ex) bge-m3',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '모델 파일 이름 ex) llama-3.1-8b',
  `platform` longtext COLLATE utf8mb4_general_ci COMMENT '모델 세팅 (key, value) JSON 문자열을 String 화 한 값',
  `is_using` bit(1) NOT NULL COMMENT '모델파일 사용 여부. [2025-04-23 기준] 모델파일과 모델은 1:1 맵핑. 추후 1:N 이 가능하다면 필요 없음',
  `shape` int NOT NULL COMMENT '차원 정보',
  `generation_config` longtext COLLATE utf8mb4_general_ci COMMENT '모델파일 세팅 초기값 (key, value) JSON 문자열을 String 화 한 값',
  `initial_setting` longtext COLLATE utf8mb4_general_ci COMMENT '모델별 모델설정 초기값 (key, value) JSON 문자열을 String 화 한 값. modelsetting 을 위한 조회 값',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='모델파일 카테고리 테이블. 해당 모델파일과 모델은 1:1 맵핑';


-- rag_mdb.tokenizer_path definition

CREATE TABLE `tokenizer_path` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '토큰 ID',
  `mid` bigint DEFAULT NULL COMMENT '모델 ID',
  `python_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Triton 서버 챗봇 채팅 url',
  `tokenizer_count_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '임베딩 모델 토크나이저 카운팅 경로',
  `tokenizer_emb_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '임베딩 모델 토크나이저 경로',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='임배딩 모델을 위한 토크나이저 path 테이블.\r\n0.5 버전에서는 사용하지 않음. 모든 경로가 동일하기 때문에 nmt-km 코드에 하드코딩 해둔 상태.';


-- rag_mdb.model definition

CREATE TABLE `model` (
  `m_id` bigint NOT NULL AUTO_INCREMENT COMMENT '모델 ID',
  `category_id` bigint NOT NULL COMMENT '모델 카테고리 ID',
  `model_file_id` bigint DEFAULT NULL COMMENT '모델파일 ID',
  `m_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '모델명',
  `installation_method` enum('API','MODEL_FILE') COLLATE utf8mb4_general_ci NOT NULL COMMENT '모델 생성 방식',
  `status` enum('ACTIVE','ERROR','INACTIVE','REGISTERED','STANDBY','USING','PROCESSING') COLLATE utf8mb4_general_ci NOT NULL COMMENT '모델 상태값',
  `description` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '모델 설명',
  `is_deleted` bit(1) NOT NULL COMMENT '모델 삭제 여부',
  `model_setting` longtext COLLATE utf8mb4_general_ci COMMENT '모델 세팅 (key, value) JSON 문자열을 String 화 한 값',
  `uploaded_date` datetime(6) NOT NULL COMMENT '업로드 시간',
  `version` int DEFAULT NULL COMMENT '모델 버전',
  `active_vision` bit(1) NOT NULL COMMENT '모델카테고리가 sLM/LLM 일 경우에만 T/F Toggle. 나머지는 X',
  PRIMARY KEY (`m_id`),
  UNIQUE KEY `UK1opemuewrov6s5eukoodtd08o` (`model_file_id`),
  KEY `FK9csl9nfv3hlnaqejqhahqhar6` (`category_id`),
  CONSTRAINT `FK5llnrjpm6itp1elod6c3wpc1` FOREIGN KEY (`model_file_id`) REFERENCES `model_file` (`id`),
  CONSTRAINT `FK9csl9nfv3hlnaqejqhahqhar6` FOREIGN KEY (`category_id`) REFERENCES `model_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='모델 테이블';


-- rag_mdb.api_registration definition

CREATE TABLE `api_registration` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'Service API 등록 ID',
  `provider` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지원 API(Azure OpenAI Service / OpenAI ChatGPT)',
  `model_id` bigint NOT NULL COMMENT '모델 ID',
  `model_setting` text COLLATE utf8mb4_general_ci COMMENT '모델 설정 값',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK595fnqygv08nxj2bl5yv1dh3h` (`model_id`),
  CONSTRAINT `FKtpertskqp9u04m344tlax7wjl` FOREIGN KEY (`model_id`) REFERENCES `model` (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='API 방식으로 생성한 모델 관리 테이블';