-- DB update 2021_01_15_00 -> 2021_01_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_01_15_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_01_15_00 2021_01_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1607523114128420000'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1607523114128420000');

UPDATE `game_tele` SET `position_x`=3677.532959, `position_y`=2166.696777, `position_z`=35.807980, `orientation`=2.301083 WHERE `id`=455; -- Azjol-Nerub

DELETE FROM `game_tele` WHERE `id` IN (1435, 1436, 1437, 1438, 1439, 1440, 1441, 1442, 1443, 1444, 1445, 1446, 1447, 1448, 1449, 1450, 1490);
INSERT INTO `game_tele` (`id`, `position_x`, `position_y`, `position_z`, `orientation`, `map`, `name`) VALUES
(1435, -8779.900391, 834.348816, 94.680130, 0.653013, 0, 'TheStockade'),
(1436, 3643.309082, 2036.508545, 1.787417, 4.339186, 571, 'AhnKahet'),
(1437, -8750.759766, -4442.196777, -199.259674, 4.376938, 1, 'TheCullingOfStratholme'),
(1438, 6952.303711, -4419.976074, 450.077667, 0.807518, 571, 'GundrakDungeon'),
(1439, 9182.918945, -1384.819336, 1110.209961, 5.577789, 571, 'HallsOfLightning'),
(1440, 8921.905273, -993.503479, 1039.410278, 1.552629, 571, 'HallsOfStone'),
(1441, 5630.444824, 1994.013184, 798.058777, 4.587561, 571, 'HallsOfReflection'),
(1442, 5598.744629, 2015.848999, 798.041748, 3.810007, 571, 'PitOfSaron'),
(1443, 3600.503174, 197.339737, -113.760269, 5.299053, 571, 'RubySanctum'),
(1444, 3859.444580, 6989.848145, 152.040604, 5.796354, 571, 'EyeOfEternity'),
(1445, 5666.252930, 2009.196899, 798.041443, 5.431836, 571, 'ForgeOfSouls'),
(1446, 3893.507568, 6985.326172, 69.487663, 6.278975, 571, 'TheNexusDungeon'),
(1447, 3457.111816, 262.394165, -113.819344, 3.282578, 571, 'ObsidianSanctum'),
(1448, 3879.958740, 6984.616211, 106.3120190, 3.196693, 571, 'Oculus'),
(1449, 8515.682617, 716.982239, 558.247864, 1.573150, 571, 'TrialOfTheCrusader'),
(1450, 9327.247070, -1114.638550, 1245.147095, 0.002312, 571, 'UlduarRaid'),
(1490, 5474.070313, 39.761471, 149.545578, 6.271932, 571, 'CrystalsongForest');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;