-- rag_adb.admin_agree definition

CREATE TABLE `admin_agree` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'PK, auto increment',
  `user_id` bigint NOT NULL COMMENT '동의한 관리자(사용자) ID',
  `agreed_at` datetime NOT NULL COMMENT '동의한 시각',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='관리자 동의';


-- rag_adb.user_agree definition

CREATE TABLE `user_agree` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'PK, auto increment',
  `user_id` bigint NOT NULL COMMENT '동의한 사용자 ID',
  `agreed_at` datetime NOT NULL COMMENT '동의한 시각',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자 동의';


-- rag_adb.users definition

CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL COMMENT '가입일시(최초 등록)',
  `dept_cd` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '부서코드',
  `dept_nm` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '부서명',
  `email` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '직원 이메일',
  `emp_nm` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '직원 성명',
  `emp_no` varchar(20) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사번',
  `enabled` bit(1) NOT NULL COMMENT '사용여부',
  `login_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '사용자 아이디',
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL COMMENT '비밀번호',
  `pos_cd` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '직급, 호칭코드',
  `pos_nm` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '직급, 호칭명',
  `role` tinyint DEFAULT NULL COMMENT '권한',
  `updated_at` datetime(6) NOT NULL COMMENT '수정일시(변경 일자)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKfdhyupxgkfjueabcd54uhycn8` (`emp_no`),
  UNIQUE KEY `UKh1ic89iqbkwfexq4ox9gfdnlp` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='사용자 정보';