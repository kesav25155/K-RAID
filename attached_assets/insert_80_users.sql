 he could have escaped via the lobby line if he stayed alert.', '2026-04-20 11:45:15+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:11 seconds the cover defender was off balance; perfect touch window.', '2026-04-20 11:45:15+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A coordinated dash at 0:11 seconds when raider was crossing back would have been ideal.', '2026-04-20 11:45:15+00');

  -- User 77: Muthukumar P (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Muthukumar P', 'player', '2026-04-21 12:52:28+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders were not watching the raider''s foot movement; they reacted only after the touch was made.', '2026-04-21 12:52:28+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'All four defenders should have closed in together since it was a do or die raid.', '2026-04-21 12:52:28+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have waited for defenders to advance and then attempted a back kick at 0:14 seconds.', '2026-04-21 12:52:28+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted dash at 0:08 seconds before raider could secure the bonus.', '2026-04-21 12:52:28+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have tried for a multi-touch since the defense was out of position.', '2026-04-21 12:52:28+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by feinting towards the corner and then quickly turning to the cover side he could have broken free.', '2026-04-21 12:52:28+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only chance was to use his shoulder to break the cover''s hold and dive into the lobby.', '2026-04-21 12:52:28+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'His footwork was poor; he stepped flat-footed which made it easy for defenders to grip his ankle.', '2026-04-21 12:52:28+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted touch around 0:09 seconds when the right cover was isolated and out of position.', '2026-04-21 12:52:28+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, ankle hold at 0:10 seconds when raider extended his foot would have made it a super tackle.', '2026-04-21 12:52:28+00');

  -- User 78: Nithyanandam S (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Nithyanandam S', 'coach', '2026-04-22 13:59:41+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders stood flat-footed and did not attempt ankle hold when the raider was within reach.', '2026-04-22 13:59:41+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have attempted a thigh hold combined with a back hold to stop the raider''s return.', '2026-04-22 13:59:41+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch point was not necessary; raider should have collected bonus at 0:06 seconds and returned safely to maintain team strength.', '2026-04-22 13:59:41+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No early tackle was needed; a coordinated dash at 0:13 seconds when raider tried to return would have worked.', '2026-04-22 13:59:41+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch was the right call but he should have targeted the corner instead of the cover defender.', '2026-04-22 13:59:41+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used a back kick to break the ankle hold and then sprinted across the mid line.', '2026-04-22 13:59:41+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No realistic escape; the defenders had locked both legs and waist simultaneously.', '2026-04-22 13:59:41+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He overcommitted to the touch and lost balance, which gave defenders the perfect tackle window.', '2026-04-22 13:59:41+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was risky; raider should have stayed back and tried only at 0:14 seconds during the return.', '2026-04-22 13:59:41+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by left corner at 0:09 seconds was the prime moment; he hesitated and lost the chance.', '2026-04-22 13:59:41+00');

  -- User 79: Pugazhendi R (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Pugazhendi R', 'player', '2026-04-23 14:06:54+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Right cover defender lost balance during the dash attempt and that gave the raider an easy return.', '2026-04-23 14:06:54+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Cover should have anticipated the dubki and dropped low to catch the raider''s waist.', '2026-04-23 14:06:54+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch was possible at 0:09 seconds with a quick kick on the right cover.', '2026-04-23 14:06:54+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle window was at 0:11 seconds when raider tried for bonus; corner should have caught the trailing foot.', '2026-04-23 14:06:54+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, touch was the right strategy; he should have used dubki to escape after the touch.', '2026-04-23 14:06:54+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible with a side roll to break the back hold; many top raiders use this move.', '2026-04-23 14:06:54+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was not possible; the corner had locked the ankle perfectly with cover backing up.', '2026-04-23 14:06:54+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went for two touches when one was enough; the second attempt got him caught.', '2026-04-23 14:06:54+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch attempt was right at 0:09 seconds using a toe touch on the left cover defender.', '2026-04-23 14:06:54+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted back hold at 0:12 seconds; that was the perfect moment.', '2026-04-23 14:06:54+00');

  -- User 80: Rameshkumar V (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Rameshkumar V', 'player', '2026-04-24 15:13:07+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defense was not in proper formation. The right corner was standing too deep allowing the raider easy lobby access.', '2026-04-24 15:13:07+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The cover should have come up to support the corner with an ankle hold the moment the raider touched.', '2026-04-24 15:13:07+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have attempted a hand touch on the right corner at 0:12 seconds when the defender stepped forward unguarded.', '2026-04-24 15:13:07+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:10 seconds would have been ideal when the raider was in the middle court.', '2026-04-24 15:13:07+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have avoided touch point and gone only for bonus since defenders were strong.', '2026-04-24 15:13:07+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible if he had used the lobby rule — stepping out before defenders made full contact.', '2026-04-24 15:13:07+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was possible only with a dubki under the cover''s arms but timing was already lost.', '2026-04-24 15:13:07+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not use any feint or dubki; he raided in a straight line which made him predictable.', '2026-04-24 15:13:07+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have first secured bonus at 0:07 seconds and then attempted touch at 0:13 seconds.', '2026-04-24 15:13:07+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:13 seconds when raider was tired and returning.', '2026-04-24 15:13:07+00');

END $$;
