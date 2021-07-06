-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.2.38-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- gym 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `gym` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gym`;

-- 테이블 gym.address 구조 내보내기
CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 gym.address:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

-- 테이블 gym.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_mail` varchar(50) NOT NULL,
  `admin_pw` varchar(50) NOT NULL,
  `admin_address` varchar(100) NOT NULL,
  `admin_phone` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='관리자 정보가 있는 테이블';

-- 테이블 데이터 gym.admin:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 gym.branch 구조 내보내기
CREATE TABLE IF NOT EXISTS `branch` (
  `permission_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `FK_branch_admin` (`admin_id`),
  CONSTRAINT `FK__permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `FK_branch_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점장 허가된 테이블';

-- 테이블 데이터 gym.branch:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;

-- 테이블 gym.building 구조 내보내기
CREATE TABLE IF NOT EXISTS `building` (
  `building_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `building_detail` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`building_id`),
  KEY `FK_building_memeber` (`member_id`),
  KEY `FK_building_address` (`address_id`),
  CONSTRAINT `FK_building_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `FK_building_memeber` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원이 등록한 건물 테이블';

-- 테이블 데이터 gym.building:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
/*!40000 ALTER TABLE `building` ENABLE KEYS */;

-- 테이블 gym.contract 구조 내보내기
CREATE TABLE IF NOT EXISTS `contract` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `contract_name` varchar(50) NOT NULL,
  `contract_loyalty` int(11) NOT NULL,
  `contract_duration` varchar(50) NOT NULL,
  `contract_deposit` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `FK_contract_admin` (`admin_id`),
  CONSTRAINT `FK_contract_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='계약 조건이 명시된 테이블 (카테고리)';

-- 테이블 데이터 gym.contract:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;

-- 테이블 gym.employment_type 구조 내보내기
CREATE TABLE IF NOT EXISTS `employment_type` (
  `employment_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `employment_type_name` varchar(50) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`employment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='고용형태 (카테고리)';

-- 테이블 데이터 gym.employment_type:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `employment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `employment_type` ENABLE KEYS */;

-- 테이블 gym.event 구조 내보내기
CREATE TABLE IF NOT EXISTS `event` (
  `event_code` varchar(50) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `event_title` varchar(50) NOT NULL,
  `event_content` text NOT NULL,
  `event_target` varchar(50) NOT NULL,
  `event_img` varchar(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`event_code`),
  KEY `FK_event_admin` (`admin_id`),
  CONSTRAINT `FK_event_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='이벤트 게시물 정보가 있는 테이블';

-- 테이블 데이터 gym.event:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- 테이블 gym.job_opening 구조 내보내기
CREATE TABLE IF NOT EXISTS `job_opening` (
  `job_opening_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `employment_type_id` int(11) NOT NULL,
  `job_opening_title` varchar(50) NOT NULL,
  `job_opening_content` text NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`job_opening_id`),
  KEY `FK_job_opening_employment_type` (`employment_type_id`),
  KEY `FK_job_opening_branch` (`permission_id`),
  CONSTRAINT `FK_job_opening_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`),
  CONSTRAINT `FK_job_opening_employment_type` FOREIGN KEY (`employment_type_id`) REFERENCES `employment_type` (`employment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='트레이너 채용하기 위한 테이블';

-- 테이블 데이터 gym.job_opening:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `job_opening` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_opening` ENABLE KEYS */;

-- 테이블 gym.lecture 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture` (
  `lecture_id` int(11) NOT NULL AUTO_INCREMENT,
  `trainer_application_id` int(11) NOT NULL,
  `timetable_id` int(11) NOT NULL,
  `lecture_room_id` int(11) NOT NULL,
  `lecture_category_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `lecture_name` varchar(50) NOT NULL,
  `lecture_price` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`lecture_id`) USING BTREE,
  KEY `FK_lecture_trainer_application` (`trainer_application_id`),
  KEY `FK_lecture_timetable` (`timetable_id`),
  KEY `FK_lecture_lecture_room` (`lecture_room_id`),
  KEY `FK_lecture_lecture_category` (`lecture_category_id`),
  KEY `FK_lecture_branch` (`permission_id`),
  CONSTRAINT `FK_lecture_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`),
  CONSTRAINT `FK_lecture_lecture_category` FOREIGN KEY (`lecture_category_id`) REFERENCES `lecture_category` (`lecture_category_id`),
  CONSTRAINT `FK_lecture_lecture_room` FOREIGN KEY (`lecture_room_id`) REFERENCES `lecture_room` (`lecture_room_id`),
  CONSTRAINT `FK_lecture_timetable` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`),
  CONSTRAINT `FK_lecture_trainer_application` FOREIGN KEY (`trainer_application_id`) REFERENCES `trainer_application` (`trainer_application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점별 개설된 강좌정보';

-- 테이블 데이터 gym.lecture:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lecture` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture` ENABLE KEYS */;

-- 테이블 gym.lecture_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_category` (
  `lecture_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_category` varchar(50) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`lecture_category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강좌 (카테고리)';

-- 테이블 데이터 gym.lecture_category:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lecture_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_category` ENABLE KEYS */;

-- 테이블 gym.lecture_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_member` (
  `lecture_member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `lecture_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`lecture_member_id`),
  KEY `FK_lecture_member_memeber` (`member_id`),
  KEY `FK_lecture_member_lecture` (`lecture_id`),
  CONSTRAINT `FK_lecture_member_lecture` FOREIGN KEY (`lecture_id`) REFERENCES `lecture` (`lecture_id`),
  CONSTRAINT `FK_lecture_member_memeber` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강좌를 구매한 회원 테이블';

-- 테이블 데이터 gym.lecture_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lecture_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_member` ENABLE KEYS */;

-- 테이블 gym.lecture_member_entrance_record 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_member_entrance_record` (
  `lecture_member_entrance_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_member_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `entrance_time` datetime NOT NULL,
  `exit_time` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`lecture_member_entrance_record_id`),
  KEY `FK_lecture_member_entrance_record_lecture_member` (`lecture_member_id`),
  KEY `FK_lecture_member_entrance_record_branch` (`permission_id`),
  CONSTRAINT `FK_lecture_member_entrance_record_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`),
  CONSTRAINT `FK_lecture_member_entrance_record_lecture_member` FOREIGN KEY (`lecture_member_id`) REFERENCES `lecture_member` (`lecture_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점별 강좌회원 출입시간을 기록';

-- 테이블 데이터 gym.lecture_member_entrance_record:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lecture_member_entrance_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_member_entrance_record` ENABLE KEYS */;

-- 테이블 gym.lecture_member_inbody 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_member_inbody` (
  `lecture_member_inbody_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_member_entrance_record_id` int(11) NOT NULL,
  `trainer_application_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `skeletal_muscle_mass` int(11) NOT NULL,
  `body_fat_mass` int(11) NOT NULL,
  `BMI` int(11) NOT NULL,
  `percent_body_fat` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('남','여') NOT NULL,
  `inbody_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`lecture_member_inbody_id`),
  KEY `FK_lecture_member_inbody_lecture_member_entrance_record` (`lecture_member_entrance_record_id`),
  KEY `FK_lecture_member_inbody_trainer_recruitment` (`trainer_application_id`),
  CONSTRAINT `FK_lecture_member_inbody_lecture_member_entrance_record` FOREIGN KEY (`lecture_member_entrance_record_id`) REFERENCES `lecture_member_entrance_record` (`lecture_member_entrance_record_id`),
  CONSTRAINT `FK_lecture_member_inbody_trainer_recruitment` FOREIGN KEY (`trainer_application_id`) REFERENCES `trainer_recruitment` (`trainer_application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강좌회원 인바디 테이블';

-- 테이블 데이터 gym.lecture_member_inbody:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lecture_member_inbody` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_member_inbody` ENABLE KEYS */;

-- 테이블 gym.lecture_room 구조 내보내기
CREATE TABLE IF NOT EXISTS `lecture_room` (
  `lecture_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `lecture_room_name` varchar(50) NOT NULL,
  `lecture_room_capacity` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`lecture_room_id`),
  KEY `FK_lecture_room_branch` (`permission_id`),
  CONSTRAINT `FK_lecture_room_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점 별 강의실 정보가 명시된 테이블';

-- 테이블 데이터 gym.lecture_room:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lecture_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecture_room` ENABLE KEYS */;

-- 테이블 gym.locker 구조 내보내기
CREATE TABLE IF NOT EXISTS `locker` (
  `locker_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `locker_number` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`locker_id`),
  KEY `FK_locker_branch` (`permission_id`),
  CONSTRAINT `FK_locker_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 gym.locker:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `locker` DISABLE KEYS */;
/*!40000 ALTER TABLE `locker` ENABLE KEYS */;

-- 테이블 gym.locker_lecture_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `locker_lecture_member` (
  `locker_rental_id` int(11) NOT NULL,
  `lecture_member_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`locker_rental_id`),
  KEY `FK_locker_lecture_member_lecture_member` (`lecture_member_id`),
  CONSTRAINT `FK_locker_lecture_member_lecture_member` FOREIGN KEY (`lecture_member_id`) REFERENCES `lecture_member` (`lecture_member_id`),
  CONSTRAINT `FK_locker_lecture_member_locker_rental` FOREIGN KEY (`locker_rental_id`) REFERENCES `locker_rental` (`locker_rental_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='라커를 구매한 강좌회원 테이블';

-- 테이블 데이터 gym.locker_lecture_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `locker_lecture_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `locker_lecture_member` ENABLE KEYS */;

-- 테이블 gym.locker_membership_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `locker_membership_member` (
  `locker_rental_id` int(11) NOT NULL,
  `membership_member_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`locker_rental_id`),
  KEY `FK_locker_membership_member_membership_member` (`membership_member_id`),
  CONSTRAINT `FK_locker_membership_member_locker_rental` FOREIGN KEY (`locker_rental_id`) REFERENCES `locker_rental` (`locker_rental_id`),
  CONSTRAINT `FK_locker_membership_member_membership_member` FOREIGN KEY (`membership_member_id`) REFERENCES `membership_member` (`membership_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='라커를 구매한 운동회원 테이블';

-- 테이블 데이터 gym.locker_membership_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `locker_membership_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `locker_membership_member` ENABLE KEYS */;

-- 테이블 gym.locker_rental 구조 내보내기
CREATE TABLE IF NOT EXISTS `locker_rental` (
  `locker_rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `locker_id` int(11) NOT NULL,
  `locker_rental_price_id` int(11) NOT NULL,
  `sold_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`locker_rental_id`),
  KEY `FK_locker_rental_locker` (`locker_id`),
  KEY `FK_locker_rental_locker_rental_price` (`locker_rental_price_id`),
  CONSTRAINT `FK_locker_rental_locker` FOREIGN KEY (`locker_id`) REFERENCES `locker` (`locker_id`),
  CONSTRAINT `FK_locker_rental_locker_rental_price` FOREIGN KEY (`locker_rental_price_id`) REFERENCES `locker_rental_price` (`locker_rental_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점별 라커이용권 판매 이력';

-- 테이블 데이터 gym.locker_rental:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `locker_rental` DISABLE KEYS */;
/*!40000 ALTER TABLE `locker_rental` ENABLE KEYS */;

-- 테이블 gym.locker_rental_price 구조 내보내기
CREATE TABLE IF NOT EXISTS `locker_rental_price` (
  `locker_rental_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `locker_rental_price` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`locker_rental_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='라커1개월비용';

-- 테이블 데이터 gym.locker_rental_price:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `locker_rental_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `locker_rental_price` ENABLE KEYS */;

-- 테이블 gym.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_name` varchar(50) NOT NULL,
  `member_mail` varchar(50) NOT NULL,
  `member_pw` varchar(50) NOT NULL,
  `member_address` varchar(100) NOT NULL,
  `member_phone` varchar(50) NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='가입한 모든 회원 정보 테이블';

-- 테이블 데이터 gym.member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 gym.membership 구조 내보내기
CREATE TABLE IF NOT EXISTS `membership` (
  `membership_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `membership_price_id` int(11) NOT NULL,
  `sold_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`membership_id`),
  KEY `FK_membership_membership_price` (`membership_price_id`),
  KEY `FK_membership_branch` (`permission_id`),
  CONSTRAINT `FK_membership_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`),
  CONSTRAINT `FK_membership_membership_price` FOREIGN KEY (`membership_price_id`) REFERENCES `membership_price` (`membership_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점별 운동이용권 발급내역';

-- 테이블 데이터 gym.membership:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;

-- 테이블 gym.membership_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `membership_member` (
  `membership_member_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`membership_member_id`),
  KEY `FK_membership_member_memeber` (`member_id`),
  KEY `FK_membership_member_membership` (`membership_id`),
  CONSTRAINT `FK_membership_member_membership` FOREIGN KEY (`membership_id`) REFERENCES `membership` (`membership_id`),
  CONSTRAINT `FK_membership_member_memeber` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='운동 이용권을 구매한 회원 테이블';

-- 테이블 데이터 gym.membership_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `membership_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_member` ENABLE KEYS */;

-- 테이블 gym.membership_member_entrance_record 구조 내보내기
CREATE TABLE IF NOT EXISTS `membership_member_entrance_record` (
  `membership_member_entrance_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_member_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `entrance_time` datetime NOT NULL,
  `exit_time` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`membership_member_entrance_record_id`),
  KEY `FK_membership_member_entrance_record_membership_member` (`membership_member_id`),
  KEY `FK_membership_member_entrance_record_branch` (`permission_id`),
  CONSTRAINT `FK_membership_member_entrance_record_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`),
  CONSTRAINT `FK_membership_member_entrance_record_membership_member` FOREIGN KEY (`membership_member_id`) REFERENCES `membership_member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점별 운동회원 출입시간을 기록';

-- 테이블 데이터 gym.membership_member_entrance_record:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `membership_member_entrance_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_member_entrance_record` ENABLE KEYS */;

-- 테이블 gym.membership_member_inbody 구조 내보내기
CREATE TABLE IF NOT EXISTS `membership_member_inbody` (
  `membership_member_inbody_id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_member_entrance_record_id` int(11) NOT NULL,
  `trainer_application_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `skeletal_muscle_mass` int(11) NOT NULL,
  `body_fat_mass` int(11) NOT NULL,
  `BMI` int(11) NOT NULL,
  `percent_body_fat` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('남','여') NOT NULL,
  `inbody_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`membership_member_inbody_id`),
  KEY `FK_membership_member_inbody_membership_member_entrance_record` (`membership_member_entrance_record_id`),
  KEY `FK_membership_member_inbody_trainer_recruitment` (`trainer_application_id`),
  CONSTRAINT `FK_membership_member_inbody_membership_member_entrance_record` FOREIGN KEY (`membership_member_entrance_record_id`) REFERENCES `membership_member_entrance_record` (`membership_member_entrance_record_id`),
  CONSTRAINT `FK_membership_member_inbody_trainer_recruitment` FOREIGN KEY (`trainer_application_id`) REFERENCES `trainer_recruitment` (`trainer_application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='운동회원 인바디 테이블';

-- 테이블 데이터 gym.membership_member_inbody:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `membership_member_inbody` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_member_inbody` ENABLE KEYS */;

-- 테이블 gym.membership_price 구조 내보내기
CREATE TABLE IF NOT EXISTS `membership_price` (
  `membership_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `membership_price` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`membership_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='운동1개월비용';

-- 테이블 데이터 gym.membership_price:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `membership_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_price` ENABLE KEYS */;

-- 테이블 gym.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `notice_title` varchar(50) NOT NULL,
  `notice_content` text NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `FK__admin` (`admin_id`),
  CONSTRAINT `FK__admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='공지사항';

-- 테이블 데이터 gym.notice:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 gym.permission 구조 내보내기
CREATE TABLE IF NOT EXISTS `permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `building_id` int(11) NOT NULL,
  `contract_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `FK_permission_building` (`building_id`),
  KEY `FK_permission_contract` (`contract_id`),
  CONSTRAINT `FK_permission_building` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`),
  CONSTRAINT `FK_permission_contract` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='건물을 가진 회원이 지점장 신청하는 테이블';

-- 테이블 데이터 gym.permission:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;

-- 테이블 gym.refusal 구조 내보내기
CREATE TABLE IF NOT EXISTS `refusal` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `refusal_reason` text NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `FK_refusal_admin` (`admin_id`),
  CONSTRAINT `FK_refusal_admin` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점장 거부된 테이블';

-- 테이블 데이터 gym.refusal:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `refusal` DISABLE KEYS */;
/*!40000 ALTER TABLE `refusal` ENABLE KEYS */;

-- 테이블 gym.resume 구조 내보내기
CREATE TABLE IF NOT EXISTS `resume` (
  `resume_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `career` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `resume_img` varchar(50) NOT NULL,
  `certificate` varchar(50) NOT NULL,
  `resume_content` text NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`resume_id`),
  KEY `FK_resume_memeber` (`member_id`),
  CONSTRAINT `FK_resume_memeber` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='이력서 내용이 있는 테이블';

-- 테이블 데이터 gym.resume:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;

-- 테이블 gym.review 구조 내보내기
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `lecture_member_id` int(11) NOT NULL,
  `review_title` varchar(50) NOT NULL,
  `review_content` varchar(50) NOT NULL,
  `review_score` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `FK_review_lecture_member` (`lecture_member_id`),
  CONSTRAINT `FK_review_lecture_member` FOREIGN KEY (`lecture_member_id`) REFERENCES `lecture_member` (`lecture_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강좌회원이 남긴 후기 게시판';

-- 테이블 데이터 gym.review:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 테이블 gym.review_like 구조 내보내기
CREATE TABLE IF NOT EXISTS `review_like` (
  `review_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`review_id`,`member_id`) USING BTREE,
  KEY `FK_review_like_memeber` (`member_id`),
  CONSTRAINT `FK_review_like_memeber` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FK_review_like_review` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='후기 게시판에 회원이 남기는 좋아요 테이블';

-- 테이블 데이터 gym.review_like:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `review_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_like` ENABLE KEYS */;

-- 테이블 gym.timetable 구조 내보내기
CREATE TABLE IF NOT EXISTS `timetable` (
  `timetable_id` int(11) NOT NULL AUTO_INCREMENT,
  `timetable_day` varchar(50) NOT NULL,
  `timetable_period` varchar(50) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`timetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강좌 시간표 (카테고리)';

-- 테이블 데이터 gym.timetable:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;

-- 테이블 gym.trainer_application 구조 내보내기
CREATE TABLE IF NOT EXISTS `trainer_application` (
  `trainer_application_id` int(11) NOT NULL AUTO_INCREMENT,
  `resume_id` int(11) NOT NULL,
  `job_opening_id` int(11) NOT NULL,
  `apply_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`trainer_application_id`),
  KEY `FK_trainer_application_resume` (`resume_id`),
  KEY `FK_trainer_application_job_opening` (`job_opening_id`),
  CONSTRAINT `FK_trainer_application_job_opening` FOREIGN KEY (`job_opening_id`) REFERENCES `job_opening` (`job_opening_id`),
  CONSTRAINT `FK_trainer_application_resume` FOREIGN KEY (`resume_id`) REFERENCES `resume` (`resume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원이 강사 지원하는 테이블';

-- 테이블 데이터 gym.trainer_application:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `trainer_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_application` ENABLE KEYS */;

-- 테이블 gym.trainer_recruitment 구조 내보내기
CREATE TABLE IF NOT EXISTS `trainer_recruitment` (
  `trainer_application_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `join_date` datetime NOT NULL,
  `retire_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`trainer_application_id`),
  KEY `FK_trainer_recruitment_branch` (`permission_id`),
  CONSTRAINT `FK_trainer_recruitment_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`),
  CONSTRAINT `FK_trainer_recruitment_trainer_application` FOREIGN KEY (`trainer_application_id`) REFERENCES `trainer_application` (`trainer_application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='강사 지원에서 채용된 강사 테이블';

-- 테이블 데이터 gym.trainer_recruitment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `trainer_recruitment` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_recruitment` ENABLE KEYS */;

-- 테이블 gym.uniform_lecture_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `uniform_lecture_member` (
  `uniform_rental_id` int(11) NOT NULL,
  `lecture_member_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`uniform_rental_id`),
  KEY `FK_uniform_lecture_member_lecture_member` (`lecture_member_id`),
  CONSTRAINT `FK_uniform_lecture_member_lecture_member` FOREIGN KEY (`lecture_member_id`) REFERENCES `lecture_member` (`lecture_member_id`),
  CONSTRAINT `FK_uniform_lecture_member_uniform_rental` FOREIGN KEY (`uniform_rental_id`) REFERENCES `uniform_rental` (`uniform_rental_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='운동복을 구매한 강좌회원 테이블';

-- 테이블 데이터 gym.uniform_lecture_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `uniform_lecture_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `uniform_lecture_member` ENABLE KEYS */;

-- 테이블 gym.uniform_membership_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `uniform_membership_member` (
  `uniform_rental_id` int(11) NOT NULL,
  `membership_member_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`uniform_rental_id`),
  KEY `FK_uniform_membership_member_membership_member` (`membership_member_id`),
  CONSTRAINT `FK_uniform_membership_member_membership_member` FOREIGN KEY (`membership_member_id`) REFERENCES `membership_member` (`membership_member_id`),
  CONSTRAINT `FK_uniform_membership_member_uniform_rental` FOREIGN KEY (`uniform_rental_id`) REFERENCES `uniform_rental` (`uniform_rental_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='운동복을 구매한 운동회원 테이블';

-- 테이블 데이터 gym.uniform_membership_member:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `uniform_membership_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `uniform_membership_member` ENABLE KEYS */;

-- 테이블 gym.uniform_rental 구조 내보내기
CREATE TABLE IF NOT EXISTS `uniform_rental` (
  `uniform_rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_id` int(11) NOT NULL,
  `uniform_rental_price_id` int(11) NOT NULL,
  `sold_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`uniform_rental_id`),
  KEY `FK_uniform_rental_uniform_rental_price` (`uniform_rental_price_id`),
  KEY `FK_uniform_rental_branch` (`permission_id`),
  CONSTRAINT `FK_uniform_rental_branch` FOREIGN KEY (`permission_id`) REFERENCES `branch` (`permission_id`),
  CONSTRAINT `FK_uniform_rental_uniform_rental_price` FOREIGN KEY (`uniform_rental_price_id`) REFERENCES `uniform_rental_price` (`uniform_rental_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='지점별 운동복 이용권 판매이력';

-- 테이블 데이터 gym.uniform_rental:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `uniform_rental` DISABLE KEYS */;
/*!40000 ALTER TABLE `uniform_rental` ENABLE KEYS */;

-- 테이블 gym.uniform_rental_price 구조 내보내기
CREATE TABLE IF NOT EXISTS `uniform_rental_price` (
  `uniform_rental_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `uniform_rental_price` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`uniform_rental_price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='운동복1개월비용';

-- 테이블 데이터 gym.uniform_rental_price:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `uniform_rental_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `uniform_rental_price` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
