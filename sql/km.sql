-- rag_kdb.know_batch_job_queue definition

CREATE TABLE `know_batch_job_queue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '지식 배치',
  `created_at` datetime(6) DEFAULT NULL COMMENT '생성 시간',
  `doc_id` bigint NOT NULL COMMENT '지식문서 ID',
  `job_id` bigint NOT NULL COMMENT '잡 ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=823 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='지식 전처리 작업의 실행 순서 및 완료 상태 추적용 큐 테이블';


-- rag_kdb.know_category_hist definition

CREATE TABLE `know_category_hist` (
  `cate_hist_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `crud` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'CRUD',
  `cate_id` bigint NOT NULL COMMENT '카테고리ID',
  `cate_desc` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 설명 및 사유',
  `cate_nm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리명',
  `cate_order` int DEFAULT NULL COMMENT '정렬순서',
  `delete_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '삭제여부',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `mod_user_id` bigint DEFAULT NULL COMMENT '수정자ID',
  `pre_exec_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전처리 설정',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일시',
  `reg_user_id` bigint DEFAULT NULL COMMENT '등록자ID',
  `use_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '사용여부',
  `visibility` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '챗봇 공개 범위 (PRIVATE, COMPANY)',
  `m_id` bigint DEFAULT NULL COMMENT '모델ID',
  `m_nm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '모델명',
  `mod_user_nm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자',
  `pre_pipe_line_id` bigint DEFAULT NULL COMMENT '파이프라인ID',
  `pre_pipe_line_nm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파이프라인명',
  `reg_user_nm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  `pipeline_id` bigint DEFAULT NULL COMMENT '파이프라인ID',
  `pre_pipe_line` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '전처리 파이프라인',
  `dictionary_use_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '지식사전 사용여부',
  `cate_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '카테고리 상태',
  `index_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '오픈서치 인덱스명',
  PRIMARY KEY (`cate_hist_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7084 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='지식 카테고리 이력 테이블';


-- rag_kdb.know_dictionary_category definition

CREATE TABLE `know_dictionary_category` (
  `dictionary_category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '사전 카테고리 ID',
  `dictionary_category_nm` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전 카테고리 명',
  `dictionary_category_desc` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전 카테고리 설명',
  `reg_user_id` bigint NOT NULL COMMENT '등록자ID',
  `reg_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '등록일시',
  `mod_user_id` bigint NOT NULL COMMENT '수정자ID',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`dictionary_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사전 카테고리 테이블';


-- rag_kdb.know_dictionary_hist definition

CREATE TABLE `know_dictionary_hist` (
  `dictionary_hist_id` bigint NOT NULL AUTO_INCREMENT COMMENT '사전 Hist ID',
  `crud` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'crud',
  `dictionary_id` bigint NOT NULL COMMENT '사전 ID',
  `dictionary_category_id` bigint NOT NULL COMMENT '사전 카테고리 ID',
  `dictionary_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사전명',
  `dictionary_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사전 설명',
  `dictionary_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '사전 내용',
  `dictionary_count` int NOT NULL COMMENT '사전 항목수',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일명',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일경로',
  `delete_yn` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `inst_date` datetime(6) DEFAULT NULL COMMENT '저장일자',
  `display_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '화면표시여부',
  `reg_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  `reg_user_nm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '등록자명',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일자',
  `mod_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자 ID',
  `mod_user_nm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '수정자명',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일자',
  PRIMARY KEY (`dictionary_hist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='사전 이력 관리 테이블';


-- rag_kdb.know_dictionary_merge definition

CREATE TABLE `know_dictionary_merge` (
  `dictionary_merge_id` bigint NOT NULL AUTO_INCREMENT COMMENT '사전 ID',
  `delete_yn` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '삭제여부',
  `dictionary_category_id` bigint DEFAULT NULL COMMENT '지식사전 카테고리ID',
  `dictionary_merge_nm` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전명',
  `dictionary_merge_count` int NOT NULL COMMENT '사전 항목수',
  `dictionary_merge_desc` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전 설명',
  `dictionary_merge_content` longtext COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전 내용',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사전 파일 설명',
  `file_path` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사전 파일 경로',
  `category_id` bigint NOT NULL COMMENT '지식카테고리ID',
  `reg_user_id` bigint NOT NULL COMMENT '등록자ID',
  `reg_user_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '등록자명',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일시',
  `mod_user_id` bigint NOT NULL COMMENT '수정자ID',
  `mod_user_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자명',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`dictionary_merge_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사전 정보와 지식 통합 테이블';


-- rag_kdb.know_preprocess definition

CREATE TABLE `know_preprocess` (
  `pre_pipe_line_id` bigint NOT NULL AUTO_INCREMENT COMMENT '지식전처리 ID',
  `pre_pipe_line_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지식전처리명',
  `pre_pipe_line_desc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지식전처리설명',
  `attach_type_code` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일구분코드(1:pdf(word), 2:pdf(excel), 3:pdf(ppt), 4:xlsx)',
  `image_resolution` int DEFAULT NULL COMMENT '이미지 해상도',
  `page_split_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이아웃 추출 페이지 단분리 사용여부',
  `vertical_partition_count` int DEFAULT NULL COMMENT '수직 분할 개수',
  `analysis_criteria_value` decimal(3,2) DEFAULT NULL COMMENT '분석 기준값',
  `merge_criteria_value` decimal(3,2) DEFAULT NULL COMMENT '병합 기준값',
  `ocr_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '텍스트 추출 : OCR 사용여부',
  `text_partition` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '텍스트 분할',
  `image_description` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 설명생성',
  `table_extract_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '테이블 추출 사용여부',
  `table_padding` int DEFAULT NULL COMMENT '테이블 패딩',
  `use_gemini_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT 'Gemini 모델 사용 여부',
  `page_chunking_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '페이지 단위 청킹 여부',
  `delete_yn` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `drm_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-DRM종류',
  `drm_del_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-DRM제거 사용여부',
  `watermarks_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-워터마크 제거 사용여부',
  `watermarks_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-워터마크',
  `chungking_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-청킹 사용여부',
  `chungking_level` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-청킹 레벨',
  `reg_user_id` bigint NOT NULL COMMENT '등록자ID',
  `reg_user_nm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일시',
  `mod_user_id` bigint NOT NULL COMMENT '수정자ID',
  `mod_user_nm` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자명',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`pre_pipe_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='지식 전처리 테이블';


-- rag_kdb.know_preprocess_hist definition

CREATE TABLE `know_preprocess_hist` (
  `preprocess_hist_id` bigint NOT NULL AUTO_INCREMENT COMMENT '지식전처리 Hist ID',
  `crud` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'crud',
  `pre_pipe_line_id` bigint NOT NULL COMMENT '지식전처리 ID',
  `pre_pipe_line_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지식전처리명',
  `pre_pipe_line_desc` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '지식전처리설명',
  `image_resolution` int DEFAULT NULL COMMENT '이미지 해상도',
  `page_split_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '레이아웃 추출 페이지 단분리 사용여부',
  `vertical_partition_count` int DEFAULT NULL COMMENT '수직 분할 개수',
  `analysis_criteria_value` decimal(3,2) DEFAULT NULL COMMENT '분석 기준값',
  `merge_criteria_value` decimal(3,2) DEFAULT NULL COMMENT '병합 기준값',
  `ocr_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '텍스트 추출 : OCR 사용여부',
  `text_partition` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '텍스트 분할',
  `image_description` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '이미지 설명생성',
  `table_extract_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '테이블 추출 사용여부',
  `table_padding` int DEFAULT NULL COMMENT '테이블 패딩',
  `drm_del_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-DRM제거 사용여부',
  `drm_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-DRM종류',
  `watermarks_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-워터마크 제거 사용여부',
  `attach_type_code` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '파일구분코드(1:pdf(word), 2:pdf(excel), 3:pdf(ppt), 4:xlsx)',
  `watermarks_type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-워터마크',
  `chungking_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-청킹 사용여부',
  `chungking_level` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '미사용-청킹 레벨',
  `delete_yn` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '삭제여부',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일자',
  `reg_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자 ID',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일자',
  `mod_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자 ID',
  `inst_date` datetime(6) DEFAULT NULL COMMENT '저장일자',
  `reg_user_nm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '등록자명',
  `mod_user_nm` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '수정자명',
  `use_gemini_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT 'Gemini 모델 사용 여부',
  `page_chunking_yn` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'N' COMMENT '페이지 단위 청킹 여부',
  PRIMARY KEY (`preprocess_hist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='지식 전처리 이력 테이블';


-- rag_kdb.know_upload_batch_job definition

CREATE TABLE `know_upload_batch_job` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_id` bigint DEFAULT NULL COMMENT '잡ID',
  `cate_id` bigint DEFAULT NULL COMMENT '지식카테고리ID',
  `doc_id` bigint DEFAULT NULL COMMENT '지식문서ID',
  `job_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '배치 상태',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '배치 시작시간',
  `end_time` datetime DEFAULT NULL COMMENT '배치 종료시간',
  `error_message` text COLLATE utf8mb4_general_ci COMMENT '오류 메시지',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '저장일시',
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1697 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='지식 업로드 배치 잡 테이블';


-- rag_kdb.know_upload_batch_job_chunk definition

CREATE TABLE `know_upload_batch_job_chunk` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `job_id` bigint DEFAULT NULL COMMENT '잡ID',
  `chunk_id` decimal(20,10) NOT NULL COMMENT '청크ID',
  `job_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '배치 상태',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '배치 시작시간',
  `end_time` datetime DEFAULT NULL COMMENT '배치 종료시간',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '청크결과 텍스트',
  `embedding` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '임베딩 오류',
  `error_message` text COLLATE utf8mb4_general_ci COMMENT '오류 메시지',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '저장일시',
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108723 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='지식문서 전처리 배치 잡 테이블';


-- rag_kdb.sys_knowledge_code definition

CREATE TABLE `sys_knowledge_code` (
  `cd` varchar(10) COLLATE utf8mb4_general_ci NOT NULL COMMENT '코드',
  `idx_id` varchar(5) COLLATE utf8mb4_general_ci NOT NULL COMMENT '인덱스ID',
  `cd_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '코드명',
  `cd_order` bigint DEFAULT NULL COMMENT '정렬순서',
  `noti` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '설명',
  `use_yn` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용여부',
  `reg_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '등록자ID',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일시',
  `mod_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자ID',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`cd`,`idx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사전 시스템 코드 테이블';


-- rag_kdb.know_category definition

CREATE TABLE `know_category` (
  `cate_id` bigint NOT NULL AUTO_INCREMENT COMMENT '카테고리ID',
  `cate_order` int DEFAULT NULL COMMENT '정렬순서',
  `cate_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '카테고리명',
  `cate_desc` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '카테고리 설명 및 사유',
  `cate_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '카테고리 상태',
  `pre_pipe_line_id` bigint DEFAULT NULL COMMENT '파이프라인ID',
  `pre_pipe_line_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '파이프라인명',
  `pre_exec_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '전처리 설정',
  `use_yn` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사용여부',
  `visibility` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '챗봇 공개 범위 (PRIVATE, COMPANY)',
  `delete_yn` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '삭제여부',
  `m_id` bigint DEFAULT NULL COMMENT '모델ID',
  `m_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '모델명',
  `dictionary_use_yn` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '지식사전 사용여부',
  `index_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '오픈서치 인덱스명',
  `reg_user_id` bigint DEFAULT NULL COMMENT '등록자ID',
  `reg_user_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '등록자명',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일시',
  `mod_user_id` bigint DEFAULT NULL COMMENT '수정자ID',
  `mod_user_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자명',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  `pipeline_id` bigint DEFAULT NULL COMMENT '파이프라인ID(안씀)',
  PRIMARY KEY (`cate_id`),
  KEY `FK1hkn9bb34qr8w7ic1gf9iu0yq` (`pre_pipe_line_id`),
  CONSTRAINT `FK1hkn9bb34qr8w7ic1gf9iu0yq` FOREIGN KEY (`pre_pipe_line_id`) REFERENCES `know_preprocess` (`pre_pipe_line_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='지식 카테고리 테이블';


-- rag_kdb.know_dictionary definition

CREATE TABLE `know_dictionary` (
  `dictionary_id` bigint NOT NULL AUTO_INCREMENT COMMENT '사전 ID',
  `dictionary_category_id` bigint NOT NULL COMMENT '사전 카테고리 ID',
  `delete_yn` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '삭제여부',
  `display_yn` char(1) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '화면표시여부',
  `dictionary_nm` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전명',
  `dictionary_desc` varchar(1000) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전 설명',
  `dictionary_count` int NOT NULL COMMENT '사전 항목수',
  `dictionary_content` longtext COLLATE utf8mb4_general_ci NOT NULL COMMENT '사전 내용',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사전 파일 설명',
  `file_path` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사전 파일 경로',
  `reg_user_id` bigint NOT NULL COMMENT '등록자ID',
  `reg_user_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '등록자명',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일자',
  `mod_user_id` bigint NOT NULL COMMENT '수정자ID',
  `mod_user_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자명',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`dictionary_id`),
  KEY `FKa1yavwbg64pv18tim7ci69oye` (`dictionary_category_id`),
  CONSTRAINT `FKa1yavwbg64pv18tim7ci69oye` FOREIGN KEY (`dictionary_category_id`) REFERENCES `know_dictionary_category` (`dictionary_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사전 테이블';


-- rag_kdb.know_document definition

CREATE TABLE `know_document` (
  `doc_id` bigint NOT NULL AUTO_INCREMENT COMMENT '지식문서 ID',
  `cate_id` bigint NOT NULL COMMENT '카테고리ID',
  `cate_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '카테고리명',
  `pre_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '전처리상태',
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '파일명',
  `file_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '파일 PATH',
  `file_size` bigint NOT NULL COMMENT '파일크기',
  `reg_user_id` bigint NOT NULL COMMENT '등록자ID',
  `reg_user_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '등록자명',
  `reg_date` datetime(6) NOT NULL COMMENT '등록일시',
  `mod_user_id` bigint DEFAULT NULL COMMENT '수정자ID',
  `mod_user_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자명',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`doc_id`),
  KEY `FKrjfkii620ai560o4pp3kamim3` (`cate_id`),
  CONSTRAINT `FKrjfkii620ai560o4pp3kamim3` FOREIGN KEY (`cate_id`) REFERENCES `know_category` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='지식 문서 테이블';


-- rag_kdb.know_batch_job definition

CREATE TABLE `know_batch_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '잡 ID',
  `cate_id` bigint DEFAULT NULL COMMENT '카테고리 ID',
  `doc_id` bigint DEFAULT NULL COMMENT '지식문서 ID',
  `job_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '잡구분 (전처리:PRE)',
  `job_type_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '잡구분명',
  `job_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '배치 상태(P100(전처리 대기), P200(전처리 진행중), P300(전처리 완료), P400(전처리 완료(수정)), P500(전처리 오류), P600(지식DB 등록 중), P700(지식DB 등록 완료)',
  `error_message` text COLLATE utf8mb4_general_ci COMMENT '오류 메시지',
  `start_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '배치 시작시간',
  `end_time` datetime DEFAULT NULL COMMENT '배치 종료시간',
  `reg_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '저장일시',
  `up_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '수정일시',
  PRIMARY KEY (`job_id`),
  KEY `FKhqf6jrh5u09n1w4vcihygxla0` (`cate_id`),
  KEY `FKl6td1april11np8md2q03drcv` (`doc_id`),
  CONSTRAINT `FKhqf6jrh5u09n1w4vcihygxla0` FOREIGN KEY (`cate_id`) REFERENCES `know_category` (`cate_id`),
  CONSTRAINT `FKl6td1april11np8md2q03drcv` FOREIGN KEY (`doc_id`) REFERENCES `know_document` (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2476 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='전처 지식 배치 테이블';


-- rag_kdb.know_category_dictionary_relation definition

CREATE TABLE `know_category_dictionary_relation` (
  `cd_relation_id` bigint NOT NULL AUTO_INCREMENT COMMENT '릴레이션 ID',
  `cate_id` bigint NOT NULL COMMENT '카테고리ID',
  `dictionary_id` bigint NOT NULL COMMENT '사전ID',
  `cate_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '카테고리명',
  `dictionary_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '사전명',
  `dictionary_category_id` bigint DEFAULT NULL COMMENT '사전 카테고리ID',
  `reg_user_id` bigint DEFAULT NULL COMMENT '등록자ID',
  `reg_user_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '등록자명',
  `reg_date` datetime(6) DEFAULT NULL COMMENT '등록일시',
  `mod_user_id` bigint DEFAULT NULL COMMENT '수정자ID',
  `mod_user_nm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '수정자명',
  `mod_date` datetime(6) DEFAULT NULL COMMENT '수정일시',
  PRIMARY KEY (`cd_relation_id`),
  KEY `FKjnbl29ctf3gvr791itls0hv4q` (`cate_id`),
  KEY `FKib3ryskk15iwh0ytunk7t2mnp` (`dictionary_id`),
  CONSTRAINT `FKib3ryskk15iwh0ytunk7t2mnp` FOREIGN KEY (`dictionary_id`) REFERENCES `know_dictionary` (`dictionary_id`),
  CONSTRAINT `FKjnbl29ctf3gvr791itls0hv4q` FOREIGN KEY (`cate_id`) REFERENCES `know_category` (`cate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='지식과 사전 카테고리 릴레이션 테이블';


-- rag_kdb.know_chunk definition

CREATE TABLE `know_chunk` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `job_id` bigint NOT NULL COMMENT '잡 ID',
  `chunk_id` decimal(20,10) NOT NULL COMMENT '청크 ID',
  `page_number` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '페이지 번호',
  `title_1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '레벨 1 제목',
  `title_2` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '레벨 2 제목',
  `title_3` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '레벨 3 제목',
  `title_4` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '레벨 4 제목',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '본문',
  PRIMARY KEY (`id`),
  KEY `FK16sylagj7bsefnmew6vdrg8v2` (`job_id`),
  CONSTRAINT `FK16sylagj7bsefnmew6vdrg8v2` FOREIGN KEY (`job_id`) REFERENCES `know_batch_job` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106806 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='지식 청크 테이블';