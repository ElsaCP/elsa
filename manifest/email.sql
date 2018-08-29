insert into vmail_domains (domain) values ('semut.org');
insert into vmail_accounts (username, domain, password, quota, enabled, sendonly) values ('admin', 'semut.org', '{SHA512-CRYPT}$6$6goW9nQ67SLGV93i$vU4HDKh9CNv6FiqdgsXE1w582H4mdL3tU02QqYy/dN94iISey3ZAAx3XJw5yKjo0iZWyhvfwkhzGZoloo98Ww0', 2048, true, false);
insert into vmail_aliases (source_username, source_domain, destination_username, destination_domain, enabled) values ('webmaster', 'semut.org', 'admin', 'semut.org', true);
insert into vmail_aliases (source_username, source_domain, destination_username, destination_domain, enabled) values ('postmaster', 'semut.org', 'admin', 'semut.org', true);
insert into vmail_tlspolicies (domain, policy) values ('mailbox.org', 'dane-only');
insert into vmail_tlspolicies (domain, policy, params) values ('gmx.de', 'secure', 'match=.gmx.net');
