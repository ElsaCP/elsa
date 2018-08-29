SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `vmail_domains`;
CREATE TABLE `vmail_domains` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `domain` varchar(120) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY (`domain`)
);

DROP TABLE IF EXISTS `vmail_accounts`;
CREATE TABLE `vmail_accounts` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `username` varchar(64) NOT NULL,
    `domain` varchar(120) NOT NULL,
    `password` varchar(120) NOT NULL,
    `quota` int unsigned DEFAULT '0',
    `enabled` boolean DEFAULT '0',
    `sendonly` boolean DEFAULT '0',
    PRIMARY KEY (id),
    UNIQUE KEY (`username`, `domain`),
    FOREIGN KEY (`domain`) REFERENCES `vmail_domains` (`domain`)
);

DROP TABLE IF EXISTS `vmail_aliases`;
CREATE TABLE `vmail_aliases` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `source_username` varchar(64) NOT NULL,
    `source_domain` varchar(120) NOT NULL,
    `destination_username` varchar(64) NOT NULL,
    `destination_domain` varchar(120) NOT NULL,
    `enabled` boolean DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`source_username`, `source_domain`, `destination_username`, `destination_domain`),
    FOREIGN KEY (`source_domain`) REFERENCES `vmail_domains` (`domain`)
);

DROP TABLE IF EXISTS `vmail_tlspolicies`;
CREATE TABLE `vmail_tlspolicies` (
    `id` int unsigned NOT NULL AUTO_INCREMENT,
    `domain` varchar(120) NOT NULL,
    `policy` enum('none', 'may', 'encrypt', 'dane', 'dane-only', 'fingerprint', 'verify', 'secure') NOT NULL,
    `params` varchar(120),
    PRIMARY KEY (`id`),
    UNIQUE KEY (`domain`)
);

SET foreign_key_checks = 1;

