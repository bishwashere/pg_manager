CREATE DATABASE  IF NOT EXISTS pg_manager;

-- Independent or first order tables: START --
create table `building` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `building_id` varchar(50) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_building` (`building_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

create table `personal_doc` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `pan` varchar(50) NOT NULL,
    `aadhar` varchar(50) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_personal_doc` (`personal_doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Independent or first order tables: END --


-- Hierarchical tables: START --

create table `floor` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `floor_id` varchar(11) NOT NULL,
    `building_id` varchar(50),
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_floor` (`building_id`, `floor_id`)
    CONSTRAINT `fk_building_id` FOREIGN KEY (`building_id`)
    REFERENCES `building` (`id`) ON DELETE NO ACTION ON UPDATE
    NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

create table `room` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `floor_id` varchar(50),
    `room_id` varchar(11) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_room` (`floor_id`, `room_id`)
    CONSTRAINT `fk_room_id` FOREIGN KEY (`floor_id`)
    REFERENCES `floor` (`id`) ON DELETE NO ACTION ON UPDATE
    NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

create table `bed` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `room_id` varchar(50),
    `bed_id` varchar(11) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_bed` (`room_id`, `bed_id`)
    CONSTRAINT `fk_bed_id` FOREIGN KEY (`room_id`)
    REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE
    NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

create table `rentee` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `bed_id` varchar(11) NOT NULL,
    `fullname` varchar(100) NOT NULL,
    `doc_id` varchar(11) NOT NULL,
    `financial_id` varchar(11) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_rentee` (`bed_id`, `fullname`)
    CONSTRAINT `fk_bed_id` FOREIGN KEY (`room_id`)
    REFERENCES `room` (`id`) ON DELETE NO ACTION ON UPDATE
    NO ACTION
    CONSTRAINT `fk_doc_id` FOREIGN KEY (`doc_id`)
    REFERENCES `personal_doc` (`id`) ON DELETE NO ACTION ON UPDATE
    NO ACTION
    CONSTRAINT `fk_financial_id` FOREIGN KEY (`financial_id`)
    REFERENCES `financial` (`id`) ON DELETE NO ACTION ON UPDATE
    NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Hierarchical tables: END --
