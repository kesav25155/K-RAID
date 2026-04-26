-- Insert 80 additional users (Tamil Nadu names) with 10 responses each
  -- Total: 80 submissions + 800 responses
  -- Run this in Supabase SQL Editor

  DO $$
  DECLARE
    sub_id BIGINT;
  BEGIN
  
  -- User 1: Karthik Subramanian (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Karthik Subramanian', 'coach', '2026-04-05 08:00:00+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The left in defender did not back up his corner partner during the chain tackle attempt.', '2026-04-05 08:00:00+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have used the lobby rule to their advantage by pushing the raider into the side line area.', '2026-04-05 08:00:00+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:12 seconds the cover defender was isolated; that was the perfect window for a touch.', '2026-04-05 08:00:00+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited until the raider crossed baulk line and then tackled at 0:11 seconds.', '2026-04-05 08:00:00+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Given his team was trailing, the touch attempt was correct but he held on too long.', '2026-04-05 08:00:00+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, a dubki under the chain tackle would have freed him; he had the body strength for it.', '2026-04-05 08:00:00+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have tried a desperate side roll but the chances were less than 10 percent.', '2026-04-05 08:00:00+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He did not check the lobby; he could have escaped via the lobby line if he stayed alert.', '2026-04-05 08:00:00+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:11 seconds the cover defender was off balance; perfect touch window.', '2026-04-05 08:00:00+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A coordinated dash at 0:11 seconds when raider was crossing back would have been ideal.', '2026-04-05 08:00:00+00');

  -- User 2: Vignesh Ramamurthy (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Vignesh Ramamurthy', 'player', '2026-04-06 09:07:13+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders were not watching the raider''s foot movement; they reacted only after the touch was made.', '2026-04-06 09:07:13+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'All four defenders should have closed in together since it was a do or die raid.', '2026-04-06 09:07:13+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have waited for defenders to advance and then attempted a back kick at 0:14 seconds.', '2026-04-06 09:07:13+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted dash at 0:08 seconds before raider could secure the bonus.', '2026-04-06 09:07:13+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have tried for a multi-touch since the defense was out of position.', '2026-04-06 09:07:13+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by feinting towards the corner and then quickly turning to the cover side he could have broken free.', '2026-04-06 09:07:13+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only chance was to use his shoulder to break the cover''s hold and dive into the lobby.', '2026-04-06 09:07:13+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'His footwork was poor; he stepped flat-footed which made it easy for defenders to grip his ankle.', '2026-04-06 09:07:13+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted touch around 0:09 seconds when the right cover was isolated and out of position.', '2026-04-06 09:07:13+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, ankle hold at 0:10 seconds when raider extended his foot would have made it a super tackle.', '2026-04-06 09:07:13+00');

  -- User 3: Saravanan Murugesan (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Saravanan Murugesan', 'player', '2026-04-07 10:14:26+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders stood flat-footed and did not attempt ankle hold when the raider was within reach.', '2026-04-07 10:14:26+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have attempted a thigh hold combined with a back hold to stop the raider''s return.', '2026-04-07 10:14:26+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch point was not necessary; raider should have collected bonus at 0:06 seconds and returned safely to maintain team strength.', '2026-04-07 10:14:26+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No early tackle was needed; a coordinated dash at 0:13 seconds when raider tried to return would have worked.', '2026-04-07 10:14:26+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch was the right call but he should have targeted the corner instead of the cover defender.', '2026-04-07 10:14:26+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used a back kick to break the ankle hold and then sprinted across the mid line.', '2026-04-07 10:14:26+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No realistic escape; the defenders had locked both legs and waist simultaneously.', '2026-04-07 10:14:26+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He overcommitted to the touch and lost balance, which gave defenders the perfect tackle window.', '2026-04-07 10:14:26+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was risky; raider should have stayed back and tried only at 0:14 seconds during the return.', '2026-04-07 10:14:26+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by left corner at 0:09 seconds was the prime moment; he hesitated and lost the chance.', '2026-04-07 10:14:26+00');

  -- User 4: Dinesh Kumar S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Dinesh Kumar S', 'player', '2026-04-08 11:21:39+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Right cover defender lost balance during the dash attempt and that gave the raider an easy return.', '2026-04-08 11:21:39+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Cover should have anticipated the dubki and dropped low to catch the raider''s waist.', '2026-04-08 11:21:39+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch was possible at 0:09 seconds with a quick kick on the right cover.', '2026-04-08 11:21:39+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle window was at 0:11 seconds when raider tried for bonus; corner should have caught the trailing foot.', '2026-04-08 11:21:39+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, touch was the right strategy; he should have used dubki to escape after the touch.', '2026-04-08 11:21:39+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible with a side roll to break the back hold; many top raiders use this move.', '2026-04-08 11:21:39+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was not possible; the corner had locked the ankle perfectly with cover backing up.', '2026-04-08 11:21:39+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went for two touches when one was enough; the second attempt got him caught.', '2026-04-08 11:21:39+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch attempt was right at 0:09 seconds using a toe touch on the left cover defender.', '2026-04-08 11:21:39+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted back hold at 0:12 seconds; that was the perfect moment.', '2026-04-08 11:21:39+00');

  -- User 5: Prabhakaran M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Prabhakaran M', 'player', '2026-04-09 12:28:52+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defense was not in proper formation. The right corner was standing too deep allowing the raider easy lobby access.', '2026-04-09 12:28:52+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The cover should have come up to support the corner with an ankle hold the moment the raider touched.', '2026-04-09 12:28:52+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have attempted a hand touch on the right corner at 0:12 seconds when the defender stepped forward unguarded.', '2026-04-09 12:28:52+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:10 seconds would have been ideal when the raider was in the middle court.', '2026-04-09 12:28:52+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have avoided touch point and gone only for bonus since defenders were strong.', '2026-04-09 12:28:52+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible if he had used the lobby rule — stepping out before defenders made full contact.', '2026-04-09 12:28:52+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was possible only with a dubki under the cover''s arms but timing was already lost.', '2026-04-09 12:28:52+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not use any feint or dubki; he raided in a straight line which made him predictable.', '2026-04-09 12:28:52+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have first secured bonus at 0:07 seconds and then attempted touch at 0:13 seconds.', '2026-04-09 12:28:52+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:13 seconds when raider was tired and returning.', '2026-04-09 12:28:52+00');

  -- User 6: Senthil Velan (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Senthil Velan', 'player', '2026-04-10 13:35:05+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The all-out pressure was on but the defense panicked and attempted single tackles instead of chain formation.', '2026-04-10 13:35:05+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have set a block formation near the baulk line to cut off the raider''s escape route.', '2026-04-10 13:35:05+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then if defenders broke chain, attempt touch at 0:10 seconds.', '2026-04-10 13:35:05+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a thigh hold at 0:10 seconds when raider was momentarily off balance.', '2026-04-10 13:35:05+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should not have tried; bonus alone would have given the team momentum to recover.', '2026-04-10 13:35:05+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used his upper body strength and dragged the defender across with him.', '2026-04-10 13:35:05+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have dragged the chain towards the mid line for half a meter more, but full escape was unlikely.', '2026-04-10 13:35:05+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not respect the chain tackle; he should have known the defenders were waiting in formation.', '2026-04-10 13:35:05+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have waited for defenders to advance and then attempted a turning kick at 0:13 seconds.', '2026-04-10 13:35:05+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt was needed at 0:11 seconds since defense had only 4 players on mat.', '2026-04-10 13:35:05+00');

  -- User 7: Murugan Pandian (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Murugan Pandian', 'player', '2026-04-11 14:42:18+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender released his hold prematurely, the raider used that gap to make a touch and return safely.', '2026-04-11 14:42:18+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have formed a chain tackle with corner and cover combined to lock the raider''s legs.', '2026-04-11 14:42:18+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, the raider should have only gone for bonus around 0:05 seconds since the score was balanced and touch attempt was risky.', '2026-04-11 14:42:18+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should not have attacked early; they should have waited till raider committed to a touch around 0:12 seconds.', '2026-04-11 14:42:18+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, the touch attempt was justified given the score difference; execution was the only issue.', '2026-04-11 14:42:18+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by using a frog jump over the corner defender he could have crossed the mid line easily.', '2026-04-11 14:42:18+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Almost no chance; the raider was outnumbered with all four defenders forming a complete chain.', '2026-04-11 14:42:18+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He attempted a hand touch on the cover without first securing his escape route to the mid line.', '2026-04-11 14:42:18+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted a hand touch on the corner at 0:10 seconds when he stepped forward unguarded.', '2026-04-11 14:42:18+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:12 seconds using a back hold by the cover defender.', '2026-04-11 14:42:18+00');

  -- User 8: Arul Selvam (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Arul Selvam', 'coach', '2026-04-12 15:49:31+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders gave too much space in the lobby; the raider used the lobby line to score and escape.', '2026-04-12 15:49:31+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have used a wrist catch and pulled the raider into the half court for an easy point.', '2026-04-12 15:49:31+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have stayed back and tried for a hand touch around 0:13 seconds when defenders were chained.', '2026-04-12 15:49:31+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt would have been good at 0:12 seconds since the team had only 4 defenders left.', '2026-04-12 15:49:31+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch attempt was correct since being top raider he had the responsibility to bring back a point.', '2026-04-12 15:49:31+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A quick scorpion kick followed by a dive towards the mid line would have been the escape route.', '2026-04-12 15:49:31+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape would require a turning kick combined with a sprint; very low probability in this position.', '2026-04-12 15:49:31+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He kept his back to the corner defender; that gave the corner an easy back hold opportunity.', '2026-04-12 15:49:31+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, he should have gone for a multi-point raid by combining bonus at 0:06 and touch at 0:11.', '2026-04-12 15:49:31+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a wrist catch at 0:09 seconds and pulled raider into the half court.', '2026-04-12 15:49:31+00');

  -- User 9: Bharathi Raja (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Bharathi Raja', 'player', '2026-04-13 16:56:44+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defenders did not coordinate well; the corner defender broke the chain too early which allowed the raider to slip through the gap.', '2026-04-13 16:56:44+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The remaining two defenders on the other side should have attempted a stunning dash to push the raider out of the lobby.', '2026-04-13 16:56:44+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted a touch around 0:10 seconds when the cover defender was off balance, but bonus point would have been the safer choice.', '2026-04-13 16:56:44+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, defense should have attempted ankle hold at 0:08 seconds when the raider extended his foot for the bonus line.', '2026-04-13 16:56:44+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have first secured bonus and only then attempted a touch on the weak side defender.', '2026-04-13 16:56:44+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A side step combined with a quick hand touch followed by a sprint to baulk line would have worked.', '2026-04-13 16:56:44+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense was tight; raider would have needed a backward dive into the lobby to escape.', '2026-04-13 16:56:44+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'The raider lost focus on the corner defender who came from behind for the ankle hold.', '2026-04-13 16:56:44+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch attempt was right at 0:12 seconds when the defenders broke chain formation briefly.', '2026-04-13 16:56:44+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted thigh hold at 0:08 seconds when raider was off balance.', '2026-04-13 16:56:44+00');

  -- User 10: Chandran Krishnamurthy (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Chandran Krishnamurthy', 'player', '2026-04-14 17:03:57+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defender who got touched did not call for ankle hold support from his teammates.', '2026-04-14 17:03:57+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A proper ankle hold by the corner combined with cover backup would have made it a super tackle.', '2026-04-14 17:03:57+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'A toe touch on the left in defender was possible at 0:11 seconds when he leaned forward.', '2026-04-14 17:03:57+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by holding position; tackle should be attempted only when raider commits.', '2026-04-14 17:03:57+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have attempted bonus first as a safe point and then risked the touch.', '2026-04-14 17:03:57+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by stepping into the lobby just before the defenders gripped him, he would have scored two points.', '2026-04-14 17:03:57+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense closed all angles; even a top raider would have struggled to escape this hold.', '2026-04-14 17:03:57+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Mistake was approaching the cover defender directly without setting up the move with a feint.', '2026-04-14 17:03:57+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds but he hesitated; quick decision making was missing.', '2026-04-14 17:03:57+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:13 seconds with a chain tackle when raider extended for the touch.', '2026-04-14 17:03:57+00');

  -- User 11: Elango Subbiah (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Elango Subbiah', 'player', '2026-04-15 18:10:10+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender attempted a back hold without support, raider twisted out using a dubki movement.', '2026-04-15 18:10:10+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They should have communicated to set a trap on the weak side instead of staying in default positions.', '2026-04-15 18:10:10+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The first safe move was touching the baulk line. The raider should have tried for the bonus line at around 0:08 seconds to secure points first; touch is not always mandatory when the score is balanced.', '2026-04-15 18:10:10+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Since the raider did not attempt bonus, it was safer to wait. Once raider goes for bonus or touch, then attempt ankle hold around that moment.', '2026-04-15 18:10:10+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, the raider was correct to attempt the touch since his team needed points to recover.', '2026-04-15 18:10:10+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have escaped by stepping into the lobby before contact; that would have given two points.', '2026-04-15 18:10:10+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was very tough; only a frog jump over the corner could have worked.', '2026-04-15 18:10:10+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He stayed too long in the raid; should have returned by 25 seconds with bonus point.', '2026-04-15 18:10:10+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, since the score was balanced, raider should have only collected bonus at 0:06 seconds.', '2026-04-15 18:10:10+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by waiting; tackle should be attempted only when raider commits to a touch.', '2026-04-15 18:10:10+00');

  -- User 12: Ganesan Nataraj (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Ganesan Nataraj', 'player', '2026-04-16 19:17:23+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'There was no proper communication between the corner and cover; they both attempted the same dash leaving a gap behind.', '2026-04-16 19:17:23+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The in defenders should have rushed forward immediately when the raider extended his leg for a toe touch.', '2026-04-16 19:17:23+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No need for a touch attempt; with even score the raider should have just taken bonus at 0:07 seconds.', '2026-04-16 19:17:23+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:14 seconds when the raider was tired and returning.', '2026-04-16 19:17:23+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, with the team needing points he had to go for touch; the timing was just slightly off.', '2026-04-16 19:17:23+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a struggle technique by leaning forward and dragging defenders past the mid line.', '2026-04-16 19:17:23+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only a high jump over the cover defender could have worked, but the raider was already off balance.', '2026-04-16 19:17:23+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He used too much energy on the dash and could not retreat fast enough when defenders closed in.', '2026-04-16 19:17:23+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted touch at 0:10 seconds with a back kick on the right in defender.', '2026-04-16 19:17:23+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle window was at 0:08 seconds with an ankle hold by the right corner.', '2026-04-16 19:17:23+00');

  -- User 13: Hariharan Iyer (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Hariharan Iyer', 'player', '2026-04-17 08:24:36+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was loose at the baulk line, they should have advanced together as a unit.', '2026-04-17 08:24:36+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Better foot positioning by the in defenders would have prevented the lobby escape.', '2026-04-17 08:24:36+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the left corner who was leaning forward.', '2026-04-17 08:24:36+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted a back hold at 0:09 seconds, that was the prime moment.', '2026-04-17 08:24:36+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Since the scorecard was not balanced, the situation demanded a point. Yes, raider should have tried — first confirming bonus and then attempting touch.', '2026-04-17 08:24:36+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, being the top raider he could have escaped using a dubki when the defender pair approached for a dash.', '2026-04-17 08:24:36+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No, the chain was perfectly formed; escape was almost impossible without a super move.', '2026-04-17 08:24:36+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider made the mistake of attempting touch on the strongest defender instead of targeting the weak side.', '2026-04-17 08:24:36+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the cover defender who was leaning forward.', '2026-04-17 08:24:36+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:09 seconds was the right window; cover should have supported the corner.', '2026-04-17 08:24:36+00');

  -- User 14: Iniyan Rajendran (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Iniyan Rajendran', 'player', '2026-04-18 09:31:49+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was caught off guard, the cover did not anticipate the raider''s hand touch and reacted too late.', '2026-04-18 09:31:49+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A coordinated dash from both ends would have trapped the raider inside the half line.', '2026-04-18 09:31:49+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have first touched the baulk line at 0:04 seconds and then attempted bonus at 0:08 seconds before returning.', '2026-04-18 09:31:49+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by corner at 0:09 seconds was the right window; cover should have backed up immediately.', '2026-04-18 09:31:49+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have attempted touch but with a quick hand touch and immediate return, not a long stay.', '2026-04-18 09:31:49+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible by using a turning kick to disorient the cover and breaking through the gap.', '2026-04-18 09:31:49+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was impossible at that point; he should have surrendered earlier and saved the all-out.', '2026-04-18 09:31:49+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not call for any teammate''s help and went alone into a 4 v 1 situation.', '2026-04-18 09:31:49+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone at 0:05 seconds was sufficient given the team strength on the mat.', '2026-04-18 09:31:49+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted block at 0:10 seconds to push raider out of the lobby line.', '2026-04-18 09:31:49+00');

  -- User 15: Jeevanandham R (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Jeevanandham R', 'coach', '2026-04-19 10:38:02+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The corner failed to use a thigh hold and the raider easily broke free using a side step.', '2026-04-19 10:38:02+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The corner could have attempted a blocking dash to push the raider out of bounds.', '2026-04-19 10:38:02+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone was sufficient; a touch attempt at 0:10 seconds would have been too risky.', '2026-04-19 10:38:02+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle opportunity was at 0:13 seconds when the raider was crossing back over the mid line.', '2026-04-19 10:38:02+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch point was necessary but he should have used the lobby line for a safer escape.', '2026-04-19 10:38:02+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a bonus line touch and immediately retreated using a back jump.', '2026-04-19 10:38:02+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'The defending team''s brilliance worked here; no gap was left. Escape was nearly impossible unless raider attempted a high jump over the defender.', '2026-04-19 10:38:02+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went too deep into the defense without watching defender positions; he should have stayed near the mid line.', '2026-04-19 10:38:02+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then a quick toe touch on the left corner at 0:11 seconds would have been ideal.', '2026-04-19 10:38:02+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited till raider committed to bonus and then attempted dash at 0:11 seconds.', '2026-04-19 10:38:02+00');

  -- User 16: Kannan Thirumalai (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Kannan Thirumalai', 'player', '2026-04-20 11:45:15+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The left in defender did not back up his corner partner during the chain tackle attempt.', '2026-04-20 11:45:15+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have used the lobby rule to their advantage by pushing the raider into the side line area.', '2026-04-20 11:45:15+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:12 seconds the cover defender was isolated; that was the perfect window for a touch.', '2026-04-20 11:45:15+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited until the raider crossed baulk line and then tackled at 0:11 seconds.', '2026-04-20 11:45:15+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Given his team was trailing, the touch attempt was correct but he held on too long.', '2026-04-20 11:45:15+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, a dubki under the chain tackle would have freed him; he had the body strength for it.', '2026-04-20 11:45:15+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have tried a desperate side roll but the chances were less than 10 percent.', '2026-04-20 11:45:15+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He did not check the lobby; he could have escaped via the lobby line if he stayed alert.', '2026-04-20 11:45:15+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:11 seconds the cover defender was off balance; perfect touch window.', '2026-04-20 11:45:15+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A coordinated dash at 0:11 seconds when raider was crossing back would have been ideal.', '2026-04-20 11:45:15+00');

  -- User 17: Lakshmanan P (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Lakshmanan P', 'player', '2026-04-21 12:52:28+00') RETURNING id INTO sub_id;
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

  -- User 18: Mahalingam V (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Mahalingam V', 'player', '2026-04-22 13:59:41+00') RETURNING id INTO sub_id;
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

  -- User 19: Nallathambi K (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Nallathambi K', 'player', '2026-04-23 14:06:54+00') RETURNING id INTO sub_id;
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

  -- User 20: Oviyan Sundaram (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Oviyan Sundaram', 'player', '2026-04-24 15:13:07+00') RETURNING id INTO sub_id;
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

  -- User 21: Pandiyan Velmurugan (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Pandiyan Velmurugan', 'player', '2026-04-05 16:20:20+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The all-out pressure was on but the defense panicked and attempted single tackles instead of chain formation.', '2026-04-05 16:20:20+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have set a block formation near the baulk line to cut off the raider''s escape route.', '2026-04-05 16:20:20+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then if defenders broke chain, attempt touch at 0:10 seconds.', '2026-04-05 16:20:20+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a thigh hold at 0:10 seconds when raider was momentarily off balance.', '2026-04-05 16:20:20+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should not have tried; bonus alone would have given the team momentum to recover.', '2026-04-05 16:20:20+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used his upper body strength and dragged the defender across with him.', '2026-04-05 16:20:20+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have dragged the chain towards the mid line for half a meter more, but full escape was unlikely.', '2026-04-05 16:20:20+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not respect the chain tackle; he should have known the defenders were waiting in formation.', '2026-04-05 16:20:20+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have waited for defenders to advance and then attempted a turning kick at 0:13 seconds.', '2026-04-05 16:20:20+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt was needed at 0:11 seconds since defense had only 4 players on mat.', '2026-04-05 16:20:20+00');

  -- User 22: Ramaswamy Krishnan (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Ramaswamy Krishnan', 'coach', '2026-04-06 17:27:33+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender released his hold prematurely, the raider used that gap to make a touch and return safely.', '2026-04-06 17:27:33+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have formed a chain tackle with corner and cover combined to lock the raider''s legs.', '2026-04-06 17:27:33+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, the raider should have only gone for bonus around 0:05 seconds since the score was balanced and touch attempt was risky.', '2026-04-06 17:27:33+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should not have attacked early; they should have waited till raider committed to a touch around 0:12 seconds.', '2026-04-06 17:27:33+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, the touch attempt was justified given the score difference; execution was the only issue.', '2026-04-06 17:27:33+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by using a frog jump over the corner defender he could have crossed the mid line easily.', '2026-04-06 17:27:33+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Almost no chance; the raider was outnumbered with all four defenders forming a complete chain.', '2026-04-06 17:27:33+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He attempted a hand touch on the cover without first securing his escape route to the mid line.', '2026-04-06 17:27:33+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted a hand touch on the corner at 0:10 seconds when he stepped forward unguarded.', '2026-04-06 17:27:33+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:12 seconds using a back hold by the cover defender.', '2026-04-06 17:27:33+00');

  -- User 23: Sathish Mohan (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Sathish Mohan', 'player', '2026-04-07 18:34:46+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders gave too much space in the lobby; the raider used the lobby line to score and escape.', '2026-04-07 18:34:46+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have used a wrist catch and pulled the raider into the half court for an easy point.', '2026-04-07 18:34:46+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have stayed back and tried for a hand touch around 0:13 seconds when defenders were chained.', '2026-04-07 18:34:46+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt would have been good at 0:12 seconds since the team had only 4 defenders left.', '2026-04-07 18:34:46+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch attempt was correct since being top raider he had the responsibility to bring back a point.', '2026-04-07 18:34:46+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A quick scorpion kick followed by a dive towards the mid line would have been the escape route.', '2026-04-07 18:34:46+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape would require a turning kick combined with a sprint; very low probability in this position.', '2026-04-07 18:34:46+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He kept his back to the corner defender; that gave the corner an easy back hold opportunity.', '2026-04-07 18:34:46+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, he should have gone for a multi-point raid by combining bonus at 0:06 and touch at 0:11.', '2026-04-07 18:34:46+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a wrist catch at 0:09 seconds and pulled raider into the half court.', '2026-04-07 18:34:46+00');

  -- User 24: Thiruvengadam N (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Thiruvengadam N', 'player', '2026-04-08 19:41:59+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defenders did not coordinate well; the corner defender broke the chain too early which allowed the raider to slip through the gap.', '2026-04-08 19:41:59+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The remaining two defenders on the other side should have attempted a stunning dash to push the raider out of the lobby.', '2026-04-08 19:41:59+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted a touch around 0:10 seconds when the cover defender was off balance, but bonus point would have been the safer choice.', '2026-04-08 19:41:59+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, defense should have attempted ankle hold at 0:08 seconds when the raider extended his foot for the bonus line.', '2026-04-08 19:41:59+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have first secured bonus and only then attempted a touch on the weak side defender.', '2026-04-08 19:41:59+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A side step combined with a quick hand touch followed by a sprint to baulk line would have worked.', '2026-04-08 19:41:59+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense was tight; raider would have needed a backward dive into the lobby to escape.', '2026-04-08 19:41:59+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'The raider lost focus on the corner defender who came from behind for the ankle hold.', '2026-04-08 19:41:59+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch attempt was right at 0:12 seconds when the defenders broke chain formation briefly.', '2026-04-08 19:41:59+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted thigh hold at 0:08 seconds when raider was off balance.', '2026-04-08 19:41:59+00');

  -- User 25: Udhayakumar A (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Udhayakumar A', 'player', '2026-04-09 08:48:12+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defender who got touched did not call for ankle hold support from his teammates.', '2026-04-09 08:48:12+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A proper ankle hold by the corner combined with cover backup would have made it a super tackle.', '2026-04-09 08:48:12+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'A toe touch on the left in defender was possible at 0:11 seconds when he leaned forward.', '2026-04-09 08:48:12+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by holding position; tackle should be attempted only when raider commits.', '2026-04-09 08:48:12+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have attempted bonus first as a safe point and then risked the touch.', '2026-04-09 08:48:12+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by stepping into the lobby just before the defenders gripped him, he would have scored two points.', '2026-04-09 08:48:12+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense closed all angles; even a top raider would have struggled to escape this hold.', '2026-04-09 08:48:12+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Mistake was approaching the cover defender directly without setting up the move with a feint.', '2026-04-09 08:48:12+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds but he hesitated; quick decision making was missing.', '2026-04-09 08:48:12+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:13 seconds with a chain tackle when raider extended for the touch.', '2026-04-09 08:48:12+00');

  -- User 26: Vetrivel S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Vetrivel S', 'player', '2026-04-10 09:55:25+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender attempted a back hold without support, raider twisted out using a dubki movement.', '2026-04-10 09:55:25+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They should have communicated to set a trap on the weak side instead of staying in default positions.', '2026-04-10 09:55:25+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The first safe move was touching the baulk line. The raider should have tried for the bonus line at around 0:08 seconds to secure points first; touch is not always mandatory when the score is balanced.', '2026-04-10 09:55:25+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Since the raider did not attempt bonus, it was safer to wait. Once raider goes for bonus or touch, then attempt ankle hold around that moment.', '2026-04-10 09:55:25+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, the raider was correct to attempt the touch since his team needed points to recover.', '2026-04-10 09:55:25+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have escaped by stepping into the lobby before contact; that would have given two points.', '2026-04-10 09:55:25+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was very tough; only a frog jump over the corner could have worked.', '2026-04-10 09:55:25+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He stayed too long in the raid; should have returned by 25 seconds with bonus point.', '2026-04-10 09:55:25+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, since the score was balanced, raider should have only collected bonus at 0:06 seconds.', '2026-04-10 09:55:25+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by waiting; tackle should be attempted only when raider commits to a touch.', '2026-04-10 09:55:25+00');

  -- User 27: Yuvaraj Manikandan (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Yuvaraj Manikandan', 'player', '2026-04-11 10:02:38+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'There was no proper communication between the corner and cover; they both attempted the same dash leaving a gap behind.', '2026-04-11 10:02:38+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The in defenders should have rushed forward immediately when the raider extended his leg for a toe touch.', '2026-04-11 10:02:38+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No need for a touch attempt; with even score the raider should have just taken bonus at 0:07 seconds.', '2026-04-11 10:02:38+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:14 seconds when the raider was tired and returning.', '2026-04-11 10:02:38+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, with the team needing points he had to go for touch; the timing was just slightly off.', '2026-04-11 10:02:38+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a struggle technique by leaning forward and dragging defenders past the mid line.', '2026-04-11 10:02:38+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only a high jump over the cover defender could have worked, but the raider was already off balance.', '2026-04-11 10:02:38+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He used too much energy on the dash and could not retreat fast enough when defenders closed in.', '2026-04-11 10:02:38+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted touch at 0:10 seconds with a back kick on the right in defender.', '2026-04-11 10:02:38+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle window was at 0:08 seconds with an ankle hold by the right corner.', '2026-04-11 10:02:38+00');

  -- User 28: Anbazhagan R (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Anbazhagan R', 'player', '2026-04-12 11:09:51+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was loose at the baulk line, they should have advanced together as a unit.', '2026-04-12 11:09:51+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Better foot positioning by the in defenders would have prevented the lobby escape.', '2026-04-12 11:09:51+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the left corner who was leaning forward.', '2026-04-12 11:09:51+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted a back hold at 0:09 seconds, that was the prime moment.', '2026-04-12 11:09:51+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Since the scorecard was not balanced, the situation demanded a point. Yes, raider should have tried — first confirming bonus and then attempting touch.', '2026-04-12 11:09:51+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, being the top raider he could have escaped using a dubki when the defender pair approached for a dash.', '2026-04-12 11:09:51+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No, the chain was perfectly formed; escape was almost impossible without a super move.', '2026-04-12 11:09:51+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider made the mistake of attempting touch on the strongest defender instead of targeting the weak side.', '2026-04-12 11:09:51+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the cover defender who was leaning forward.', '2026-04-12 11:09:51+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:09 seconds was the right window; cover should have supported the corner.', '2026-04-12 11:09:51+00');

  -- User 29: Balamurugan T (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Balamurugan T', 'coach', '2026-04-13 12:16:04+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was caught off guard, the cover did not anticipate the raider''s hand touch and reacted too late.', '2026-04-13 12:16:04+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A coordinated dash from both ends would have trapped the raider inside the half line.', '2026-04-13 12:16:04+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have first touched the baulk line at 0:04 seconds and then attempted bonus at 0:08 seconds before returning.', '2026-04-13 12:16:04+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by corner at 0:09 seconds was the right window; cover should have backed up immediately.', '2026-04-13 12:16:04+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have attempted touch but with a quick hand touch and immediate return, not a long stay.', '2026-04-13 12:16:04+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible by using a turning kick to disorient the cover and breaking through the gap.', '2026-04-13 12:16:04+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was impossible at that point; he should have surrendered earlier and saved the all-out.', '2026-04-13 12:16:04+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not call for any teammate''s help and went alone into a 4 v 1 situation.', '2026-04-13 12:16:04+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone at 0:05 seconds was sufficient given the team strength on the mat.', '2026-04-13 12:16:04+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted block at 0:10 seconds to push raider out of the lobby line.', '2026-04-13 12:16:04+00');

  -- User 30: Chinnasamy K (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Chinnasamy K', 'player', '2026-04-14 13:23:17+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The corner failed to use a thigh hold and the raider easily broke free using a side step.', '2026-04-14 13:23:17+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The corner could have attempted a blocking dash to push the raider out of bounds.', '2026-04-14 13:23:17+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone was sufficient; a touch attempt at 0:10 seconds would have been too risky.', '2026-04-14 13:23:17+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle opportunity was at 0:13 seconds when the raider was crossing back over the mid line.', '2026-04-14 13:23:17+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch point was necessary but he should have used the lobby line for a safer escape.', '2026-04-14 13:23:17+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a bonus line touch and immediately retreated using a back jump.', '2026-04-14 13:23:17+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'The defending team''s brilliance worked here; no gap was left. Escape was nearly impossible unless raider attempted a high jump over the defender.', '2026-04-14 13:23:17+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went too deep into the defense without watching defender positions; he should have stayed near the mid line.', '2026-04-14 13:23:17+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then a quick toe touch on the left corner at 0:11 seconds would have been ideal.', '2026-04-14 13:23:17+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited till raider committed to bonus and then attempted dash at 0:11 seconds.', '2026-04-14 13:23:17+00');

  -- User 31: Devaraj Subramani (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Devaraj Subramani', 'player', '2026-04-15 14:30:30+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The left in defender did not back up his corner partner during the chain tackle attempt.', '2026-04-15 14:30:30+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have used the lobby rule to their advantage by pushing the raider into the side line area.', '2026-04-15 14:30:30+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:12 seconds the cover defender was isolated; that was the perfect window for a touch.', '2026-04-15 14:30:30+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited until the raider crossed baulk line and then tackled at 0:11 seconds.', '2026-04-15 14:30:30+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Given his team was trailing, the touch attempt was correct but he held on too long.', '2026-04-15 14:30:30+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, a dubki under the chain tackle would have freed him; he had the body strength for it.', '2026-04-15 14:30:30+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have tried a desperate side roll but the chances were less than 10 percent.', '2026-04-15 14:30:30+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He did not check the lobby; he could have escaped via the lobby line if he stayed alert.', '2026-04-15 14:30:30+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:11 seconds the cover defender was off balance; perfect touch window.', '2026-04-15 14:30:30+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A coordinated dash at 0:11 seconds when raider was crossing back would have been ideal.', '2026-04-15 14:30:30+00');

  -- User 32: Easwaran V (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Easwaran V', 'player', '2026-04-16 15:37:43+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders were not watching the raider''s foot movement; they reacted only after the touch was made.', '2026-04-16 15:37:43+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'All four defenders should have closed in together since it was a do or die raid.', '2026-04-16 15:37:43+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have waited for defenders to advance and then attempted a back kick at 0:14 seconds.', '2026-04-16 15:37:43+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted dash at 0:08 seconds before raider could secure the bonus.', '2026-04-16 15:37:43+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have tried for a multi-touch since the defense was out of position.', '2026-04-16 15:37:43+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by feinting towards the corner and then quickly turning to the cover side he could have broken free.', '2026-04-16 15:37:43+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only chance was to use his shoulder to break the cover''s hold and dive into the lobby.', '2026-04-16 15:37:43+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'His footwork was poor; he stepped flat-footed which made it easy for defenders to grip his ankle.', '2026-04-16 15:37:43+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted touch around 0:09 seconds when the right cover was isolated and out of position.', '2026-04-16 15:37:43+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, ankle hold at 0:10 seconds when raider extended his foot would have made it a super tackle.', '2026-04-16 15:37:43+00');

  -- User 33: Gunasekaran M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Gunasekaran M', 'player', '2026-04-17 16:44:56+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders stood flat-footed and did not attempt ankle hold when the raider was within reach.', '2026-04-17 16:44:56+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have attempted a thigh hold combined with a back hold to stop the raider''s return.', '2026-04-17 16:44:56+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch point was not necessary; raider should have collected bonus at 0:06 seconds and returned safely to maintain team strength.', '2026-04-17 16:44:56+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No early tackle was needed; a coordinated dash at 0:13 seconds when raider tried to return would have worked.', '2026-04-17 16:44:56+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch was the right call but he should have targeted the corner instead of the cover defender.', '2026-04-17 16:44:56+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used a back kick to break the ankle hold and then sprinted across the mid line.', '2026-04-17 16:44:56+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No realistic escape; the defenders had locked both legs and waist simultaneously.', '2026-04-17 16:44:56+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He overcommitted to the touch and lost balance, which gave defenders the perfect tackle window.', '2026-04-17 16:44:56+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was risky; raider should have stayed back and tried only at 0:14 seconds during the return.', '2026-04-17 16:44:56+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by left corner at 0:09 seconds was the prime moment; he hesitated and lost the chance.', '2026-04-17 16:44:56+00');

  -- User 34: Harikrishnan S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Harikrishnan S', 'player', '2026-04-18 17:51:09+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Right cover defender lost balance during the dash attempt and that gave the raider an easy return.', '2026-04-18 17:51:09+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Cover should have anticipated the dubki and dropped low to catch the raider''s waist.', '2026-04-18 17:51:09+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch was possible at 0:09 seconds with a quick kick on the right cover.', '2026-04-18 17:51:09+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle window was at 0:11 seconds when raider tried for bonus; corner should have caught the trailing foot.', '2026-04-18 17:51:09+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, touch was the right strategy; he should have used dubki to escape after the touch.', '2026-04-18 17:51:09+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible with a side roll to break the back hold; many top raiders use this move.', '2026-04-18 17:51:09+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was not possible; the corner had locked the ankle perfectly with cover backing up.', '2026-04-18 17:51:09+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went for two touches when one was enough; the second attempt got him caught.', '2026-04-18 17:51:09+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch attempt was right at 0:09 seconds using a toe touch on the left cover defender.', '2026-04-18 17:51:09+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted back hold at 0:12 seconds; that was the perfect moment.', '2026-04-18 17:51:09+00');

  -- User 35: Ilangovan P (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Ilangovan P', 'player', '2026-04-19 18:58:22+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defense was not in proper formation. The right corner was standing too deep allowing the raider easy lobby access.', '2026-04-19 18:58:22+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The cover should have come up to support the corner with an ankle hold the moment the raider touched.', '2026-04-19 18:58:22+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have attempted a hand touch on the right corner at 0:12 seconds when the defender stepped forward unguarded.', '2026-04-19 18:58:22+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:10 seconds would have been ideal when the raider was in the middle court.', '2026-04-19 18:58:22+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have avoided touch point and gone only for bonus since defenders were strong.', '2026-04-19 18:58:22+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible if he had used the lobby rule — stepping out before defenders made full contact.', '2026-04-19 18:58:22+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was possible only with a dubki under the cover''s arms but timing was already lost.', '2026-04-19 18:58:22+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not use any feint or dubki; he raided in a straight line which made him predictable.', '2026-04-19 18:58:22+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have first secured bonus at 0:07 seconds and then attempted touch at 0:13 seconds.', '2026-04-19 18:58:22+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:13 seconds when raider was tired and returning.', '2026-04-19 18:58:22+00');

  -- User 36: Jayakumar R (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Jayakumar R', 'coach', '2026-04-20 19:05:35+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The all-out pressure was on but the defense panicked and attempted single tackles instead of chain formation.', '2026-04-20 19:05:35+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have set a block formation near the baulk line to cut off the raider''s escape route.', '2026-04-20 19:05:35+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then if defenders broke chain, attempt touch at 0:10 seconds.', '2026-04-20 19:05:35+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a thigh hold at 0:10 seconds when raider was momentarily off balance.', '2026-04-20 19:05:35+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should not have tried; bonus alone would have given the team momentum to recover.', '2026-04-20 19:05:35+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used his upper body strength and dragged the defender across with him.', '2026-04-20 19:05:35+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have dragged the chain towards the mid line for half a meter more, but full escape was unlikely.', '2026-04-20 19:05:35+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not respect the chain tackle; he should have known the defenders were waiting in formation.', '2026-04-20 19:05:35+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have waited for defenders to advance and then attempted a turning kick at 0:13 seconds.', '2026-04-20 19:05:35+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt was needed at 0:11 seconds since defense had only 4 players on mat.', '2026-04-20 19:05:35+00');

  -- User 37: Kathiresan M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Kathiresan M', 'player', '2026-04-21 08:12:48+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender released his hold prematurely, the raider used that gap to make a touch and return safely.', '2026-04-21 08:12:48+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have formed a chain tackle with corner and cover combined to lock the raider''s legs.', '2026-04-21 08:12:48+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, the raider should have only gone for bonus around 0:05 seconds since the score was balanced and touch attempt was risky.', '2026-04-21 08:12:48+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should not have attacked early; they should have waited till raider committed to a touch around 0:12 seconds.', '2026-04-21 08:12:48+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, the touch attempt was justified given the score difference; execution was the only issue.', '2026-04-21 08:12:48+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by using a frog jump over the corner defender he could have crossed the mid line easily.', '2026-04-21 08:12:48+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Almost no chance; the raider was outnumbered with all four defenders forming a complete chain.', '2026-04-21 08:12:48+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He attempted a hand touch on the cover without first securing his escape route to the mid line.', '2026-04-21 08:12:48+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted a hand touch on the corner at 0:10 seconds when he stepped forward unguarded.', '2026-04-21 08:12:48+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:12 seconds using a back hold by the cover defender.', '2026-04-21 08:12:48+00');

  -- User 38: Loganathan V (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Loganathan V', 'player', '2026-04-22 09:19:01+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders gave too much space in the lobby; the raider used the lobby line to score and escape.', '2026-04-22 09:19:01+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have used a wrist catch and pulled the raider into the half court for an easy point.', '2026-04-22 09:19:01+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have stayed back and tried for a hand touch around 0:13 seconds when defenders were chained.', '2026-04-22 09:19:01+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt would have been good at 0:12 seconds since the team had only 4 defenders left.', '2026-04-22 09:19:01+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch attempt was correct since being top raider he had the responsibility to bring back a point.', '2026-04-22 09:19:01+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A quick scorpion kick followed by a dive towards the mid line would have been the escape route.', '2026-04-22 09:19:01+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape would require a turning kick combined with a sprint; very low probability in this position.', '2026-04-22 09:19:01+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He kept his back to the corner defender; that gave the corner an easy back hold opportunity.', '2026-04-22 09:19:01+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, he should have gone for a multi-point raid by combining bonus at 0:06 and touch at 0:11.', '2026-04-22 09:19:01+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a wrist catch at 0:09 seconds and pulled raider into the half court.', '2026-04-22 09:19:01+00');

  -- User 39: Manikandan Pandiyan (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Manikandan Pandiyan', 'player', '2026-04-23 10:26:14+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defenders did not coordinate well; the corner defender broke the chain too early which allowed the raider to slip through the gap.', '2026-04-23 10:26:14+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The remaining two defenders on the other side should have attempted a stunning dash to push the raider out of the lobby.', '2026-04-23 10:26:14+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted a touch around 0:10 seconds when the cover defender was off balance, but bonus point would have been the safer choice.', '2026-04-23 10:26:14+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, defense should have attempted ankle hold at 0:08 seconds when the raider extended his foot for the bonus line.', '2026-04-23 10:26:14+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have first secured bonus and only then attempted a touch on the weak side defender.', '2026-04-23 10:26:14+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A side step combined with a quick hand touch followed by a sprint to baulk line would have worked.', '2026-04-23 10:26:14+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense was tight; raider would have needed a backward dive into the lobby to escape.', '2026-04-23 10:26:14+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'The raider lost focus on the corner defender who came from behind for the ankle hold.', '2026-04-23 10:26:14+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch attempt was right at 0:12 seconds when the defenders broke chain formation briefly.', '2026-04-23 10:26:14+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted thigh hold at 0:08 seconds when raider was off balance.', '2026-04-23 10:26:14+00');

  -- User 40: Nagarajan S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Nagarajan S', 'player', '2026-04-24 11:33:27+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defender who got touched did not call for ankle hold support from his teammates.', '2026-04-24 11:33:27+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A proper ankle hold by the corner combined with cover backup would have made it a super tackle.', '2026-04-24 11:33:27+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'A toe touch on the left in defender was possible at 0:11 seconds when he leaned forward.', '2026-04-24 11:33:27+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by holding position; tackle should be attempted only when raider commits.', '2026-04-24 11:33:27+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have attempted bonus first as a safe point and then risked the touch.', '2026-04-24 11:33:27+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by stepping into the lobby just before the defenders gripped him, he would have scored two points.', '2026-04-24 11:33:27+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense closed all angles; even a top raider would have struggled to escape this hold.', '2026-04-24 11:33:27+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Mistake was approaching the cover defender directly without setting up the move with a feint.', '2026-04-24 11:33:27+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds but he hesitated; quick decision making was missing.', '2026-04-24 11:33:27+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:13 seconds with a chain tackle when raider extended for the touch.', '2026-04-24 11:33:27+00');

  -- User 41: Palanisamy K (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Palanisamy K', 'player', '2026-04-05 12:40:40+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender attempted a back hold without support, raider twisted out using a dubki movement.', '2026-04-05 12:40:40+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They should have communicated to set a trap on the weak side instead of staying in default positions.', '2026-04-05 12:40:40+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The first safe move was touching the baulk line. The raider should have tried for the bonus line at around 0:08 seconds to secure points first; touch is not always mandatory when the score is balanced.', '2026-04-05 12:40:40+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Since the raider did not attempt bonus, it was safer to wait. Once raider goes for bonus or touch, then attempt ankle hold around that moment.', '2026-04-05 12:40:40+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, the raider was correct to attempt the touch since his team needed points to recover.', '2026-04-05 12:40:40+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have escaped by stepping into the lobby before contact; that would have given two points.', '2026-04-05 12:40:40+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was very tough; only a frog jump over the corner could have worked.', '2026-04-05 12:40:40+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He stayed too long in the raid; should have returned by 25 seconds with bonus point.', '2026-04-05 12:40:40+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, since the score was balanced, raider should have only collected bonus at 0:06 seconds.', '2026-04-05 12:40:40+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by waiting; tackle should be attempted only when raider commits to a touch.', '2026-04-05 12:40:40+00');

  -- User 42: Ravichandran M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Ravichandran M', 'player', '2026-04-06 13:47:53+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'There was no proper communication between the corner and cover; they both attempted the same dash leaving a gap behind.', '2026-04-06 13:47:53+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The in defenders should have rushed forward immediately when the raider extended his leg for a toe touch.', '2026-04-06 13:47:53+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No need for a touch attempt; with even score the raider should have just taken bonus at 0:07 seconds.', '2026-04-06 13:47:53+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:14 seconds when the raider was tired and returning.', '2026-04-06 13:47:53+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, with the team needing points he had to go for touch; the timing was just slightly off.', '2026-04-06 13:47:53+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a struggle technique by leaning forward and dragging defenders past the mid line.', '2026-04-06 13:47:53+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only a high jump over the cover defender could have worked, but the raider was already off balance.', '2026-04-06 13:47:53+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He used too much energy on the dash and could not retreat fast enough when defenders closed in.', '2026-04-06 13:47:53+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted touch at 0:10 seconds with a back kick on the right in defender.', '2026-04-06 13:47:53+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle window was at 0:08 seconds with an ankle hold by the right corner.', '2026-04-06 13:47:53+00');

  -- User 43: Sundaramoorthy V (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Sundaramoorthy V', 'coach', '2026-04-07 14:54:06+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was loose at the baulk line, they should have advanced together as a unit.', '2026-04-07 14:54:06+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Better foot positioning by the in defenders would have prevented the lobby escape.', '2026-04-07 14:54:06+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the left corner who was leaning forward.', '2026-04-07 14:54:06+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted a back hold at 0:09 seconds, that was the prime moment.', '2026-04-07 14:54:06+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Since the scorecard was not balanced, the situation demanded a point. Yes, raider should have tried — first confirming bonus and then attempting touch.', '2026-04-07 14:54:06+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, being the top raider he could have escaped using a dubki when the defender pair approached for a dash.', '2026-04-07 14:54:06+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No, the chain was perfectly formed; escape was almost impossible without a super move.', '2026-04-07 14:54:06+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider made the mistake of attempting touch on the strongest defender instead of targeting the weak side.', '2026-04-07 14:54:06+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the cover defender who was leaning forward.', '2026-04-07 14:54:06+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:09 seconds was the right window; cover should have supported the corner.', '2026-04-07 14:54:06+00');

  -- User 44: Thangaraj P (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Thangaraj P', 'player', '2026-04-08 15:01:19+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was caught off guard, the cover did not anticipate the raider''s hand touch and reacted too late.', '2026-04-08 15:01:19+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A coordinated dash from both ends would have trapped the raider inside the half line.', '2026-04-08 15:01:19+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have first touched the baulk line at 0:04 seconds and then attempted bonus at 0:08 seconds before returning.', '2026-04-08 15:01:19+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by corner at 0:09 seconds was the right window; cover should have backed up immediately.', '2026-04-08 15:01:19+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have attempted touch but with a quick hand touch and immediate return, not a long stay.', '2026-04-08 15:01:19+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible by using a turning kick to disorient the cover and breaking through the gap.', '2026-04-08 15:01:19+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was impossible at that point; he should have surrendered earlier and saved the all-out.', '2026-04-08 15:01:19+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not call for any teammate''s help and went alone into a 4 v 1 situation.', '2026-04-08 15:01:19+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone at 0:05 seconds was sufficient given the team strength on the mat.', '2026-04-08 15:01:19+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted block at 0:10 seconds to push raider out of the lobby line.', '2026-04-08 15:01:19+00');

  -- User 45: Umapathy S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Umapathy S', 'player', '2026-04-09 16:08:32+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The corner failed to use a thigh hold and the raider easily broke free using a side step.', '2026-04-09 16:08:32+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The corner could have attempted a blocking dash to push the raider out of bounds.', '2026-04-09 16:08:32+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone was sufficient; a touch attempt at 0:10 seconds would have been too risky.', '2026-04-09 16:08:32+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle opportunity was at 0:13 seconds when the raider was crossing back over the mid line.', '2026-04-09 16:08:32+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch point was necessary but he should have used the lobby line for a safer escape.', '2026-04-09 16:08:32+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a bonus line touch and immediately retreated using a back jump.', '2026-04-09 16:08:32+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'The defending team''s brilliance worked here; no gap was left. Escape was nearly impossible unless raider attempted a high jump over the defender.', '2026-04-09 16:08:32+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went too deep into the defense without watching defender positions; he should have stayed near the mid line.', '2026-04-09 16:08:32+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then a quick toe touch on the left corner at 0:11 seconds would have been ideal.', '2026-04-09 16:08:32+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited till raider committed to bonus and then attempted dash at 0:11 seconds.', '2026-04-09 16:08:32+00');

  -- User 46: Velmurugan R (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Velmurugan R', 'player', '2026-04-10 17:15:45+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The left in defender did not back up his corner partner during the chain tackle attempt.', '2026-04-10 17:15:45+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have used the lobby rule to their advantage by pushing the raider into the side line area.', '2026-04-10 17:15:45+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:12 seconds the cover defender was isolated; that was the perfect window for a touch.', '2026-04-10 17:15:45+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited until the raider crossed baulk line and then tackled at 0:11 seconds.', '2026-04-10 17:15:45+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Given his team was trailing, the touch attempt was correct but he held on too long.', '2026-04-10 17:15:45+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, a dubki under the chain tackle would have freed him; he had the body strength for it.', '2026-04-10 17:15:45+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have tried a desperate side roll but the chances were less than 10 percent.', '2026-04-10 17:15:45+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He did not check the lobby; he could have escaped via the lobby line if he stayed alert.', '2026-04-10 17:15:45+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:11 seconds the cover defender was off balance; perfect touch window.', '2026-04-10 17:15:45+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A coordinated dash at 0:11 seconds when raider was crossing back would have been ideal.', '2026-04-10 17:15:45+00');

  -- User 47: Yogeshwaran M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Yogeshwaran M', 'player', '2026-04-11 18:22:58+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders were not watching the raider''s foot movement; they reacted only after the touch was made.', '2026-04-11 18:22:58+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'All four defenders should have closed in together since it was a do or die raid.', '2026-04-11 18:22:58+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have waited for defenders to advance and then attempted a back kick at 0:14 seconds.', '2026-04-11 18:22:58+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted dash at 0:08 seconds before raider could secure the bonus.', '2026-04-11 18:22:58+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have tried for a multi-touch since the defense was out of position.', '2026-04-11 18:22:58+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by feinting towards the corner and then quickly turning to the cover side he could have broken free.', '2026-04-11 18:22:58+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only chance was to use his shoulder to break the cover''s hold and dive into the lobby.', '2026-04-11 18:22:58+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'His footwork was poor; he stepped flat-footed which made it easy for defenders to grip his ankle.', '2026-04-11 18:22:58+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted touch around 0:09 seconds when the right cover was isolated and out of position.', '2026-04-11 18:22:58+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, ankle hold at 0:10 seconds when raider extended his foot would have made it a super tackle.', '2026-04-11 18:22:58+00');

  -- User 48: Adhithyan Selvakumar (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Adhithyan Selvakumar', 'player', '2026-04-12 19:29:11+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders stood flat-footed and did not attempt ankle hold when the raider was within reach.', '2026-04-12 19:29:11+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have attempted a thigh hold combined with a back hold to stop the raider''s return.', '2026-04-12 19:29:11+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch point was not necessary; raider should have collected bonus at 0:06 seconds and returned safely to maintain team strength.', '2026-04-12 19:29:11+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No early tackle was needed; a coordinated dash at 0:13 seconds when raider tried to return would have worked.', '2026-04-12 19:29:11+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch was the right call but he should have targeted the corner instead of the cover defender.', '2026-04-12 19:29:11+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used a back kick to break the ankle hold and then sprinted across the mid line.', '2026-04-12 19:29:11+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No realistic escape; the defenders had locked both legs and waist simultaneously.', '2026-04-12 19:29:11+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He overcommitted to the touch and lost balance, which gave defenders the perfect tackle window.', '2026-04-12 19:29:11+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was risky; raider should have stayed back and tried only at 0:14 seconds during the return.', '2026-04-12 19:29:11+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by left corner at 0:09 seconds was the prime moment; he hesitated and lost the chance.', '2026-04-12 19:29:11+00');

  -- User 49: Bhaskar Ramalingam (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Bhaskar Ramalingam', 'player', '2026-04-13 08:36:24+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Right cover defender lost balance during the dash attempt and that gave the raider an easy return.', '2026-04-13 08:36:24+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Cover should have anticipated the dubki and dropped low to catch the raider''s waist.', '2026-04-13 08:36:24+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch was possible at 0:09 seconds with a quick kick on the right cover.', '2026-04-13 08:36:24+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle window was at 0:11 seconds when raider tried for bonus; corner should have caught the trailing foot.', '2026-04-13 08:36:24+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, touch was the right strategy; he should have used dubki to escape after the touch.', '2026-04-13 08:36:24+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible with a side roll to break the back hold; many top raiders use this move.', '2026-04-13 08:36:24+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was not possible; the corner had locked the ankle perfectly with cover backing up.', '2026-04-13 08:36:24+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went for two touches when one was enough; the second attempt got him caught.', '2026-04-13 08:36:24+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch attempt was right at 0:09 seconds using a toe touch on the left cover defender.', '2026-04-13 08:36:24+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted back hold at 0:12 seconds; that was the perfect moment.', '2026-04-13 08:36:24+00');

  -- User 50: Chezhiyan A (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Chezhiyan A', 'coach', '2026-04-14 09:43:37+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defense was not in proper formation. The right corner was standing too deep allowing the raider easy lobby access.', '2026-04-14 09:43:37+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The cover should have come up to support the corner with an ankle hold the moment the raider touched.', '2026-04-14 09:43:37+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have attempted a hand touch on the right corner at 0:12 seconds when the defender stepped forward unguarded.', '2026-04-14 09:43:37+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:10 seconds would have been ideal when the raider was in the middle court.', '2026-04-14 09:43:37+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have avoided touch point and gone only for bonus since defenders were strong.', '2026-04-14 09:43:37+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible if he had used the lobby rule — stepping out before defenders made full contact.', '2026-04-14 09:43:37+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was possible only with a dubki under the cover''s arms but timing was already lost.', '2026-04-14 09:43:37+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not use any feint or dubki; he raided in a straight line which made him predictable.', '2026-04-14 09:43:37+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have first secured bonus at 0:07 seconds and then attempted touch at 0:13 seconds.', '2026-04-14 09:43:37+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:13 seconds when raider was tired and returning.', '2026-04-14 09:43:37+00');

  -- User 51: Dharmaraj M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Dharmaraj M', 'player', '2026-04-15 10:50:50+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The all-out pressure was on but the defense panicked and attempted single tackles instead of chain formation.', '2026-04-15 10:50:50+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have set a block formation near the baulk line to cut off the raider''s escape route.', '2026-04-15 10:50:50+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then if defenders broke chain, attempt touch at 0:10 seconds.', '2026-04-15 10:50:50+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a thigh hold at 0:10 seconds when raider was momentarily off balance.', '2026-04-15 10:50:50+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should not have tried; bonus alone would have given the team momentum to recover.', '2026-04-15 10:50:50+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used his upper body strength and dragged the defender across with him.', '2026-04-15 10:50:50+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have dragged the chain towards the mid line for half a meter more, but full escape was unlikely.', '2026-04-15 10:50:50+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not respect the chain tackle; he should have known the defenders were waiting in formation.', '2026-04-15 10:50:50+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have waited for defenders to advance and then attempted a turning kick at 0:13 seconds.', '2026-04-15 10:50:50+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt was needed at 0:11 seconds since defense had only 4 players on mat.', '2026-04-15 10:50:50+00');

  -- User 52: Ezhilarasan P (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Ezhilarasan P', 'player', '2026-04-16 11:57:03+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender released his hold prematurely, the raider used that gap to make a touch and return safely.', '2026-04-16 11:57:03+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have formed a chain tackle with corner and cover combined to lock the raider''s legs.', '2026-04-16 11:57:03+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, the raider should have only gone for bonus around 0:05 seconds since the score was balanced and touch attempt was risky.', '2026-04-16 11:57:03+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should not have attacked early; they should have waited till raider committed to a touch around 0:12 seconds.', '2026-04-16 11:57:03+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, the touch attempt was justified given the score difference; execution was the only issue.', '2026-04-16 11:57:03+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by using a frog jump over the corner defender he could have crossed the mid line easily.', '2026-04-16 11:57:03+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Almost no chance; the raider was outnumbered with all four defenders forming a complete chain.', '2026-04-16 11:57:03+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He attempted a hand touch on the cover without first securing his escape route to the mid line.', '2026-04-16 11:57:03+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted a hand touch on the corner at 0:10 seconds when he stepped forward unguarded.', '2026-04-16 11:57:03+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:12 seconds using a back hold by the cover defender.', '2026-04-16 11:57:03+00');

  -- User 53: Govindharaj K (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Govindharaj K', 'player', '2026-04-17 12:04:16+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders gave too much space in the lobby; the raider used the lobby line to score and escape.', '2026-04-17 12:04:16+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have used a wrist catch and pulled the raider into the half court for an easy point.', '2026-04-17 12:04:16+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have stayed back and tried for a hand touch around 0:13 seconds when defenders were chained.', '2026-04-17 12:04:16+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt would have been good at 0:12 seconds since the team had only 4 defenders left.', '2026-04-17 12:04:16+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch attempt was correct since being top raider he had the responsibility to bring back a point.', '2026-04-17 12:04:16+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A quick scorpion kick followed by a dive towards the mid line would have been the escape route.', '2026-04-17 12:04:16+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape would require a turning kick combined with a sprint; very low probability in this position.', '2026-04-17 12:04:16+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He kept his back to the corner defender; that gave the corner an easy back hold opportunity.', '2026-04-17 12:04:16+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, he should have gone for a multi-point raid by combining bonus at 0:06 and touch at 0:11.', '2026-04-17 12:04:16+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a wrist catch at 0:09 seconds and pulled raider into the half court.', '2026-04-17 12:04:16+00');

  -- User 54: Hemanathan S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Hemanathan S', 'player', '2026-04-18 13:11:29+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defenders did not coordinate well; the corner defender broke the chain too early which allowed the raider to slip through the gap.', '2026-04-18 13:11:29+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The remaining two defenders on the other side should have attempted a stunning dash to push the raider out of the lobby.', '2026-04-18 13:11:29+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted a touch around 0:10 seconds when the cover defender was off balance, but bonus point would have been the safer choice.', '2026-04-18 13:11:29+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, defense should have attempted ankle hold at 0:08 seconds when the raider extended his foot for the bonus line.', '2026-04-18 13:11:29+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have first secured bonus and only then attempted a touch on the weak side defender.', '2026-04-18 13:11:29+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A side step combined with a quick hand touch followed by a sprint to baulk line would have worked.', '2026-04-18 13:11:29+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense was tight; raider would have needed a backward dive into the lobby to escape.', '2026-04-18 13:11:29+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'The raider lost focus on the corner defender who came from behind for the ankle hold.', '2026-04-18 13:11:29+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch attempt was right at 0:12 seconds when the defenders broke chain formation briefly.', '2026-04-18 13:11:29+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted thigh hold at 0:08 seconds when raider was off balance.', '2026-04-18 13:11:29+00');

  -- User 55: Inbaraj V (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Inbaraj V', 'player', '2026-04-19 14:18:42+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defender who got touched did not call for ankle hold support from his teammates.', '2026-04-19 14:18:42+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A proper ankle hold by the corner combined with cover backup would have made it a super tackle.', '2026-04-19 14:18:42+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'A toe touch on the left in defender was possible at 0:11 seconds when he leaned forward.', '2026-04-19 14:18:42+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by holding position; tackle should be attempted only when raider commits.', '2026-04-19 14:18:42+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have attempted bonus first as a safe point and then risked the touch.', '2026-04-19 14:18:42+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by stepping into the lobby just before the defenders gripped him, he would have scored two points.', '2026-04-19 14:18:42+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense closed all angles; even a top raider would have struggled to escape this hold.', '2026-04-19 14:18:42+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Mistake was approaching the cover defender directly without setting up the move with a feint.', '2026-04-19 14:18:42+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds but he hesitated; quick decision making was missing.', '2026-04-19 14:18:42+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:13 seconds with a chain tackle when raider extended for the touch.', '2026-04-19 14:18:42+00');

  -- User 56: Jagadeesan M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Jagadeesan M', 'player', '2026-04-20 15:25:55+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender attempted a back hold without support, raider twisted out using a dubki movement.', '2026-04-20 15:25:55+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They should have communicated to set a trap on the weak side instead of staying in default positions.', '2026-04-20 15:25:55+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The first safe move was touching the baulk line. The raider should have tried for the bonus line at around 0:08 seconds to secure points first; touch is not always mandatory when the score is balanced.', '2026-04-20 15:25:55+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Since the raider did not attempt bonus, it was safer to wait. Once raider goes for bonus or touch, then attempt ankle hold around that moment.', '2026-04-20 15:25:55+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, the raider was correct to attempt the touch since his team needed points to recover.', '2026-04-20 15:25:55+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have escaped by stepping into the lobby before contact; that would have given two points.', '2026-04-20 15:25:55+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was very tough; only a frog jump over the corner could have worked.', '2026-04-20 15:25:55+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He stayed too long in the raid; should have returned by 25 seconds with bonus point.', '2026-04-20 15:25:55+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, since the score was balanced, raider should have only collected bonus at 0:06 seconds.', '2026-04-20 15:25:55+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by waiting; tackle should be attempted only when raider commits to a touch.', '2026-04-20 15:25:55+00');

  -- User 57: Kamaraj P (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Kamaraj P', 'coach', '2026-04-21 16:32:08+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'There was no proper communication between the corner and cover; they both attempted the same dash leaving a gap behind.', '2026-04-21 16:32:08+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The in defenders should have rushed forward immediately when the raider extended his leg for a toe touch.', '2026-04-21 16:32:08+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No need for a touch attempt; with even score the raider should have just taken bonus at 0:07 seconds.', '2026-04-21 16:32:08+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:14 seconds when the raider was tired and returning.', '2026-04-21 16:32:08+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, with the team needing points he had to go for touch; the timing was just slightly off.', '2026-04-21 16:32:08+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a struggle technique by leaning forward and dragging defenders past the mid line.', '2026-04-21 16:32:08+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only a high jump over the cover defender could have worked, but the raider was already off balance.', '2026-04-21 16:32:08+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He used too much energy on the dash and could not retreat fast enough when defenders closed in.', '2026-04-21 16:32:08+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted touch at 0:10 seconds with a back kick on the right in defender.', '2026-04-21 16:32:08+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle window was at 0:08 seconds with an ankle hold by the right corner.', '2026-04-21 16:32:08+00');

  -- User 58: Logeshwaran R (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Logeshwaran R', 'player', '2026-04-22 17:39:21+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was loose at the baulk line, they should have advanced together as a unit.', '2026-04-22 17:39:21+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Better foot positioning by the in defenders would have prevented the lobby escape.', '2026-04-22 17:39:21+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the left corner who was leaning forward.', '2026-04-22 17:39:21+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted a back hold at 0:09 seconds, that was the prime moment.', '2026-04-22 17:39:21+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Since the scorecard was not balanced, the situation demanded a point. Yes, raider should have tried — first confirming bonus and then attempting touch.', '2026-04-22 17:39:21+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, being the top raider he could have escaped using a dubki when the defender pair approached for a dash.', '2026-04-22 17:39:21+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No, the chain was perfectly formed; escape was almost impossible without a super move.', '2026-04-22 17:39:21+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider made the mistake of attempting touch on the strongest defender instead of targeting the weak side.', '2026-04-22 17:39:21+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the cover defender who was leaning forward.', '2026-04-22 17:39:21+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:09 seconds was the right window; cover should have supported the corner.', '2026-04-22 17:39:21+00');

  -- User 59: Madhanraj S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Madhanraj S', 'player', '2026-04-23 18:46:34+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was caught off guard, the cover did not anticipate the raider''s hand touch and reacted too late.', '2026-04-23 18:46:34+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A coordinated dash from both ends would have trapped the raider inside the half line.', '2026-04-23 18:46:34+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have first touched the baulk line at 0:04 seconds and then attempted bonus at 0:08 seconds before returning.', '2026-04-23 18:46:34+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by corner at 0:09 seconds was the right window; cover should have backed up immediately.', '2026-04-23 18:46:34+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have attempted touch but with a quick hand touch and immediate return, not a long stay.', '2026-04-23 18:46:34+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible by using a turning kick to disorient the cover and breaking through the gap.', '2026-04-23 18:46:34+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was impossible at that point; he should have surrendered earlier and saved the all-out.', '2026-04-23 18:46:34+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not call for any teammate''s help and went alone into a 4 v 1 situation.', '2026-04-23 18:46:34+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone at 0:05 seconds was sufficient given the team strength on the mat.', '2026-04-23 18:46:34+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted block at 0:10 seconds to push raider out of the lobby line.', '2026-04-23 18:46:34+00');

  -- User 60: Naveen Kumar V (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Naveen Kumar V', 'player', '2026-04-24 19:53:47+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The corner failed to use a thigh hold and the raider easily broke free using a side step.', '2026-04-24 19:53:47+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The corner could have attempted a blocking dash to push the raider out of bounds.', '2026-04-24 19:53:47+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone was sufficient; a touch attempt at 0:10 seconds would have been too risky.', '2026-04-24 19:53:47+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle opportunity was at 0:13 seconds when the raider was crossing back over the mid line.', '2026-04-24 19:53:47+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch point was necessary but he should have used the lobby line for a safer escape.', '2026-04-24 19:53:47+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a bonus line touch and immediately retreated using a back jump.', '2026-04-24 19:53:47+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'The defending team''s brilliance worked here; no gap was left. Escape was nearly impossible unless raider attempted a high jump over the defender.', '2026-04-24 19:53:47+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went too deep into the defense without watching defender positions; he should have stayed near the mid line.', '2026-04-24 19:53:47+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then a quick toe touch on the left corner at 0:11 seconds would have been ideal.', '2026-04-24 19:53:47+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited till raider committed to bonus and then attempted dash at 0:11 seconds.', '2026-04-24 19:53:47+00');

  -- User 61: Pradeep Anbu (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Pradeep Anbu', 'player', '2026-04-05 08:00:00+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The left in defender did not back up his corner partner during the chain tackle attempt.', '2026-04-05 08:00:00+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have used the lobby rule to their advantage by pushing the raider into the side line area.', '2026-04-05 08:00:00+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:12 seconds the cover defender was isolated; that was the perfect window for a touch.', '2026-04-05 08:00:00+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited until the raider crossed baulk line and then tackled at 0:11 seconds.', '2026-04-05 08:00:00+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Given his team was trailing, the touch attempt was correct but he held on too long.', '2026-04-05 08:00:00+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, a dubki under the chain tackle would have freed him; he had the body strength for it.', '2026-04-05 08:00:00+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have tried a desperate side roll but the chances were less than 10 percent.', '2026-04-05 08:00:00+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He did not check the lobby; he could have escaped via the lobby line if he stayed alert.', '2026-04-05 08:00:00+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:11 seconds the cover defender was off balance; perfect touch window.', '2026-04-05 08:00:00+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A coordinated dash at 0:11 seconds when raider was crossing back would have been ideal.', '2026-04-05 08:00:00+00');

  -- User 62: Rajkumar M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Rajkumar M', 'player', '2026-04-06 09:07:13+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders were not watching the raider''s foot movement; they reacted only after the touch was made.', '2026-04-06 09:07:13+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'All four defenders should have closed in together since it was a do or die raid.', '2026-04-06 09:07:13+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have waited for defenders to advance and then attempted a back kick at 0:14 seconds.', '2026-04-06 09:07:13+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted dash at 0:08 seconds before raider could secure the bonus.', '2026-04-06 09:07:13+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have tried for a multi-touch since the defense was out of position.', '2026-04-06 09:07:13+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by feinting towards the corner and then quickly turning to the cover side he could have broken free.', '2026-04-06 09:07:13+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only chance was to use his shoulder to break the cover''s hold and dive into the lobby.', '2026-04-06 09:07:13+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'His footwork was poor; he stepped flat-footed which made it easy for defenders to grip his ankle.', '2026-04-06 09:07:13+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted touch around 0:09 seconds when the right cover was isolated and out of position.', '2026-04-06 09:07:13+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, ankle hold at 0:10 seconds when raider extended his foot would have made it a super tackle.', '2026-04-06 09:07:13+00');

  -- User 63: Suriyaprakash R (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Suriyaprakash R', 'player', '2026-04-07 10:14:26+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders stood flat-footed and did not attempt ankle hold when the raider was within reach.', '2026-04-07 10:14:26+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have attempted a thigh hold combined with a back hold to stop the raider''s return.', '2026-04-07 10:14:26+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch point was not necessary; raider should have collected bonus at 0:06 seconds and returned safely to maintain team strength.', '2026-04-07 10:14:26+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No early tackle was needed; a coordinated dash at 0:13 seconds when raider tried to return would have worked.', '2026-04-07 10:14:26+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch was the right call but he should have targeted the corner instead of the cover defender.', '2026-04-07 10:14:26+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used a back kick to break the ankle hold and then sprinted across the mid line.', '2026-04-07 10:14:26+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No realistic escape; the defenders had locked both legs and waist simultaneously.', '2026-04-07 10:14:26+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He overcommitted to the touch and lost balance, which gave defenders the perfect tackle window.', '2026-04-07 10:14:26+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was risky; raider should have stayed back and tried only at 0:14 seconds during the return.', '2026-04-07 10:14:26+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by left corner at 0:09 seconds was the prime moment; he hesitated and lost the chance.', '2026-04-07 10:14:26+00');

  -- User 64: Tamilarasan K (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Tamilarasan K', 'coach', '2026-04-08 11:21:39+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Right cover defender lost balance during the dash attempt and that gave the raider an easy return.', '2026-04-08 11:21:39+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Cover should have anticipated the dubki and dropped low to catch the raider''s waist.', '2026-04-08 11:21:39+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch was possible at 0:09 seconds with a quick kick on the right cover.', '2026-04-08 11:21:39+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle window was at 0:11 seconds when raider tried for bonus; corner should have caught the trailing foot.', '2026-04-08 11:21:39+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, touch was the right strategy; he should have used dubki to escape after the touch.', '2026-04-08 11:21:39+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible with a side roll to break the back hold; many top raiders use this move.', '2026-04-08 11:21:39+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was not possible; the corner had locked the ankle perfectly with cover backing up.', '2026-04-08 11:21:39+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went for two touches when one was enough; the second attempt got him caught.', '2026-04-08 11:21:39+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch attempt was right at 0:09 seconds using a toe touch on the left cover defender.', '2026-04-08 11:21:39+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted back hold at 0:12 seconds; that was the perfect moment.', '2026-04-08 11:21:39+00');

  -- User 65: Vasanthkumar S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Vasanthkumar S', 'player', '2026-04-09 12:28:52+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defense was not in proper formation. The right corner was standing too deep allowing the raider easy lobby access.', '2026-04-09 12:28:52+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The cover should have come up to support the corner with an ankle hold the moment the raider touched.', '2026-04-09 12:28:52+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have attempted a hand touch on the right corner at 0:12 seconds when the defender stepped forward unguarded.', '2026-04-09 12:28:52+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:10 seconds would have been ideal when the raider was in the middle court.', '2026-04-09 12:28:52+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have avoided touch point and gone only for bonus since defenders were strong.', '2026-04-09 12:28:52+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible if he had used the lobby rule — stepping out before defenders made full contact.', '2026-04-09 12:28:52+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was possible only with a dubki under the cover''s arms but timing was already lost.', '2026-04-09 12:28:52+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not use any feint or dubki; he raided in a straight line which made him predictable.', '2026-04-09 12:28:52+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have first secured bonus at 0:07 seconds and then attempted touch at 0:13 seconds.', '2026-04-09 12:28:52+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:13 seconds when raider was tired and returning.', '2026-04-09 12:28:52+00');

  -- User 66: Aravind Krishnan (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Aravind Krishnan', 'player', '2026-04-10 13:35:05+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The all-out pressure was on but the defense panicked and attempted single tackles instead of chain formation.', '2026-04-10 13:35:05+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have set a block formation near the baulk line to cut off the raider''s escape route.', '2026-04-10 13:35:05+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then if defenders broke chain, attempt touch at 0:10 seconds.', '2026-04-10 13:35:05+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a thigh hold at 0:10 seconds when raider was momentarily off balance.', '2026-04-10 13:35:05+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should not have tried; bonus alone would have given the team momentum to recover.', '2026-04-10 13:35:05+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He should have used his upper body strength and dragged the defender across with him.', '2026-04-10 13:35:05+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have dragged the chain towards the mid line for half a meter more, but full escape was unlikely.', '2026-04-10 13:35:05+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not respect the chain tackle; he should have known the defenders were waiting in formation.', '2026-04-10 13:35:05+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'He should have waited for defenders to advance and then attempted a turning kick at 0:13 seconds.', '2026-04-10 13:35:05+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt was needed at 0:11 seconds since defense had only 4 players on mat.', '2026-04-10 13:35:05+00');

  -- User 67: Boopathi Raja (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Boopathi Raja', 'player', '2026-04-11 14:42:18+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender released his hold prematurely, the raider used that gap to make a touch and return safely.', '2026-04-11 14:42:18+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have formed a chain tackle with corner and cover combined to lock the raider''s legs.', '2026-04-11 14:42:18+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, the raider should have only gone for bonus around 0:05 seconds since the score was balanced and touch attempt was risky.', '2026-04-11 14:42:18+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should not have attacked early; they should have waited till raider committed to a touch around 0:12 seconds.', '2026-04-11 14:42:18+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Yes, the touch attempt was justified given the score difference; execution was the only issue.', '2026-04-11 14:42:18+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by using a frog jump over the corner defender he could have crossed the mid line easily.', '2026-04-11 14:42:18+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Almost no chance; the raider was outnumbered with all four defenders forming a complete chain.', '2026-04-11 14:42:18+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He attempted a hand touch on the cover without first securing his escape route to the mid line.', '2026-04-11 14:42:18+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted a hand touch on the corner at 0:10 seconds when he stepped forward unguarded.', '2026-04-11 14:42:18+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:12 seconds using a back hold by the cover defender.', '2026-04-11 14:42:18+00');

  -- User 68: Chandrasekar M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Chandrasekar M', 'player', '2026-04-12 15:49:31+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defenders gave too much space in the lobby; the raider used the lobby line to score and escape.', '2026-04-12 15:49:31+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Defense should have used a wrist catch and pulled the raider into the half court for an easy point.', '2026-04-12 15:49:31+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The raider should have stayed back and tried for a hand touch around 0:13 seconds when defenders were chained.', '2026-04-12 15:49:31+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A super tackle attempt would have been good at 0:12 seconds since the team had only 4 defenders left.', '2026-04-12 15:49:31+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch attempt was correct since being top raider he had the responsibility to bring back a point.', '2026-04-12 15:49:31+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A quick scorpion kick followed by a dive towards the mid line would have been the escape route.', '2026-04-12 15:49:31+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape would require a turning kick combined with a sprint; very low probability in this position.', '2026-04-12 15:49:31+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He kept his back to the corner defender; that gave the corner an easy back hold opportunity.', '2026-04-12 15:49:31+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, he should have gone for a multi-point raid by combining bonus at 0:06 and touch at 0:11.', '2026-04-12 15:49:31+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have used a wrist catch at 0:09 seconds and pulled raider into the half court.', '2026-04-12 15:49:31+00');

  -- User 69: Deepan Chakravarthy (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Deepan Chakravarthy', 'player', '2026-04-13 16:56:44+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defenders did not coordinate well; the corner defender broke the chain too early which allowed the raider to slip through the gap.', '2026-04-13 16:56:44+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The remaining two defenders on the other side should have attempted a stunning dash to push the raider out of the lobby.', '2026-04-13 16:56:44+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, raider should have attempted a touch around 0:10 seconds when the cover defender was off balance, but bonus point would have been the safer choice.', '2026-04-13 16:56:44+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, defense should have attempted ankle hold at 0:08 seconds when the raider extended his foot for the bonus line.', '2026-04-13 16:56:44+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have first secured bonus and only then attempted a touch on the weak side defender.', '2026-04-13 16:56:44+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'A side step combined with a quick hand touch followed by a sprint to baulk line would have worked.', '2026-04-13 16:56:44+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense was tight; raider would have needed a backward dive into the lobby to escape.', '2026-04-13 16:56:44+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'The raider lost focus on the corner defender who came from behind for the ankle hold.', '2026-04-13 16:56:44+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, touch attempt was right at 0:12 seconds when the defenders broke chain formation briefly.', '2026-04-13 16:56:44+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted thigh hold at 0:08 seconds when raider was off balance.', '2026-04-13 16:56:44+00');

  -- User 70: Ezhil Mathi (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Ezhil Mathi', 'player', '2026-04-14 17:03:57+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The defender who got touched did not call for ankle hold support from his teammates.', '2026-04-14 17:03:57+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A proper ankle hold by the corner combined with cover backup would have made it a super tackle.', '2026-04-14 17:03:57+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'A toe touch on the left in defender was possible at 0:11 seconds when he leaned forward.', '2026-04-14 17:03:57+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by holding position; tackle should be attempted only when raider commits.', '2026-04-14 17:03:57+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'He should have attempted bonus first as a safe point and then risked the touch.', '2026-04-14 17:03:57+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, by stepping into the lobby just before the defenders gripped him, he would have scored two points.', '2026-04-14 17:03:57+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Defense closed all angles; even a top raider would have struggled to escape this hold.', '2026-04-14 17:03:57+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Mistake was approaching the cover defender directly without setting up the move with a feint.', '2026-04-14 17:03:57+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds but he hesitated; quick decision making was missing.', '2026-04-14 17:03:57+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Tackle was possible at 0:13 seconds with a chain tackle when raider extended for the touch.', '2026-04-14 17:03:57+00');

  -- User 71: Gokulnath R (coach)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Gokulnath R', 'coach', '2026-04-15 18:10:10+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Cover defender attempted a back hold without support, raider twisted out using a dubki movement.', '2026-04-15 18:10:10+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They should have communicated to set a trap on the weak side instead of staying in default positions.', '2026-04-15 18:10:10+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'The first safe move was touching the baulk line. The raider should have tried for the bonus line at around 0:08 seconds to secure points first; touch is not always mandatory when the score is balanced.', '2026-04-15 18:10:10+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Since the raider did not attempt bonus, it was safer to wait. Once raider goes for bonus or touch, then attempt ankle hold around that moment.', '2026-04-15 18:10:10+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, the raider was correct to attempt the touch since his team needed points to recover.', '2026-04-15 18:10:10+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have escaped by stepping into the lobby before contact; that would have given two points.', '2026-04-15 18:10:10+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was very tough; only a frog jump over the corner could have worked.', '2026-04-15 18:10:10+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He stayed too long in the raid; should have returned by 25 seconds with bonus point.', '2026-04-15 18:10:10+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No, since the score was balanced, raider should have only collected bonus at 0:06 seconds.', '2026-04-15 18:10:10+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'No, defense did right by waiting; tackle should be attempted only when raider commits to a touch.', '2026-04-15 18:10:10+00');

  -- User 72: Hariprasad S (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Hariprasad S', 'player', '2026-04-16 19:17:23+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'There was no proper communication between the corner and cover; they both attempted the same dash leaving a gap behind.', '2026-04-16 19:17:23+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The in defenders should have rushed forward immediately when the raider extended his leg for a toe touch.', '2026-04-16 19:17:23+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'No need for a touch attempt; with even score the raider should have just taken bonus at 0:07 seconds.', '2026-04-16 19:17:23+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have set a trap and dashed at 0:14 seconds when the raider was tired and returning.', '2026-04-16 19:17:23+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'No, with the team needing points he had to go for touch; the timing was just slightly off.', '2026-04-16 19:17:23+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a struggle technique by leaning forward and dragging defenders past the mid line.', '2026-04-16 19:17:23+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Only a high jump over the cover defender could have worked, but the raider was already off balance.', '2026-04-16 19:17:23+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He used too much energy on the dash and could not retreat fast enough when defenders closed in.', '2026-04-16 19:17:23+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have attempted touch at 0:10 seconds with a back kick on the right in defender.', '2026-04-16 19:17:23+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle window was at 0:08 seconds with an ankle hold by the right corner.', '2026-04-16 19:17:23+00');

  -- User 73: Ilamaran P (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Ilamaran P', 'player', '2026-04-17 08:24:36+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was loose at the baulk line, they should have advanced together as a unit.', '2026-04-17 08:24:36+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'Better foot positioning by the in defenders would have prevented the lobby escape.', '2026-04-17 08:24:36+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the left corner who was leaning forward.', '2026-04-17 08:24:36+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'The right cover should have attempted a back hold at 0:09 seconds, that was the prime moment.', '2026-04-17 08:24:36+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Since the scorecard was not balanced, the situation demanded a point. Yes, raider should have tried — first confirming bonus and then attempting touch.', '2026-04-17 08:24:36+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, being the top raider he could have escaped using a dubki when the defender pair approached for a dash.', '2026-04-17 08:24:36+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'No, the chain was perfectly formed; escape was almost impossible without a super move.', '2026-04-17 08:24:36+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider made the mistake of attempting touch on the strongest defender instead of targeting the weak side.', '2026-04-17 08:24:36+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Touch was possible at 0:08 seconds using a side kick on the cover defender who was leaning forward.', '2026-04-17 08:24:36+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'A chain tackle at 0:09 seconds was the right window; cover should have supported the corner.', '2026-04-17 08:24:36+00');

  -- User 74: Jaganathan K (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Jaganathan K', 'player', '2026-04-18 09:31:49+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'Defense was caught off guard, the cover did not anticipate the raider''s hand touch and reacted too late.', '2026-04-18 09:31:49+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'A coordinated dash from both ends would have trapped the raider inside the half line.', '2026-04-18 09:31:49+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Raider should have first touched the baulk line at 0:04 seconds and then attempted bonus at 0:08 seconds before returning.', '2026-04-18 09:31:49+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Ankle hold by corner at 0:09 seconds was the right window; cover should have backed up immediately.', '2026-04-18 09:31:49+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Raider should have attempted touch but with a quick hand touch and immediate return, not a long stay.', '2026-04-18 09:31:49+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Escape was possible by using a turning kick to disorient the cover and breaking through the gap.', '2026-04-18 09:31:49+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'Escape was impossible at that point; he should have surrendered earlier and saved the all-out.', '2026-04-18 09:31:49+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'Raider did not call for any teammate''s help and went alone into a 4 v 1 situation.', '2026-04-18 09:31:49+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone at 0:05 seconds was sufficient given the team strength on the mat.', '2026-04-18 09:31:49+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have attempted block at 0:10 seconds to push raider out of the lobby line.', '2026-04-18 09:31:49+00');

  -- User 75: Karthikeyan M (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Karthikeyan M', 'player', '2026-04-19 10:38:02+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The corner failed to use a thigh hold and the raider easily broke free using a side step.', '2026-04-19 10:38:02+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'The corner could have attempted a blocking dash to push the raider out of bounds.', '2026-04-19 10:38:02+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus alone was sufficient; a touch attempt at 0:10 seconds would have been too risky.', '2026-04-19 10:38:02+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Best tackle opportunity was at 0:13 seconds when the raider was crossing back over the mid line.', '2026-04-19 10:38:02+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Touch point was necessary but he should have used the lobby line for a safer escape.', '2026-04-19 10:38:02+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'He could have used a bonus line touch and immediately retreated using a back jump.', '2026-04-19 10:38:02+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'The defending team''s brilliance worked here; no gap was left. Escape was nearly impossible unless raider attempted a high jump over the defender.', '2026-04-19 10:38:02+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He went too deep into the defense without watching defender positions; he should have stayed near the mid line.', '2026-04-19 10:38:02+00'),
    (sub_id, 5, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Bonus first at 0:05 seconds, then a quick toe touch on the left corner at 0:11 seconds would have been ideal.', '2026-04-19 10:38:02+00'),
    (sub_id, 5, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited till raider committed to bonus and then attempted dash at 0:11 seconds.', '2026-04-19 10:38:02+00');

  -- User 76: Lingesh Babu (player)
  INSERT INTO submissions (name, designation, submitted_at) VALUES ('Lingesh Babu', 'player', '2026-04-20 11:45:15+00') RETURNING id INTO sub_id;
  INSERT INTO responses (submission_id, video_id, question_index, question_text, answer_text, created_at) VALUES
    (sub_id, 1, 0, 'What mistake did the defense do?', 'The left in defender did not back up his corner partner during the chain tackle attempt.', '2026-04-20 11:45:15+00'),
    (sub_id, 1, 1, 'What else the defense could have done?', 'They could have used the lobby rule to their advantage by pushing the raider into the side line area.', '2026-04-20 11:45:15+00'),
    (sub_id, 2, 0, 'Should the raider have tried for touch point and when (eg. at 5 seconds or 0:05 seconds)?', 'Yes, between 0:09 and 0:12 seconds the cover defender was isolated; that was the perfect window for a touch.', '2026-04-20 11:45:15+00'),
    (sub_id, 2, 1, 'Should the defense have tried for tackle and when (eg. at 5 seconds or 0:05 seconds)?', 'Defense should have waited until the raider crossed baulk line and then tackled at 0:11 seconds.', '2026-04-20 11:45:15+00'),
    (sub_id, 3, 0, 'Should raider not have tried for touch point?', 'Given his team was trailing, the touch attempt was correct but he held on too long.', '2026-04-20 11:45:15+00'),
    (sub_id, 3, 1, 'Could the raider have escaped and how?', 'Yes, a dubki under the chain tackle would have freed him; he had the body strength for it.', '2026-04-20 11:45:15+00'),
    (sub_id, 4, 0, 'Could raider have escaped and how?', 'He could have tried a desperate side roll but the chances were less than 10 percent.', '2026-04-20 11:45:15+00'),
    (sub_id, 4, 1, 'What mistake did the raider do?', 'He did not check the lobby; he could have escaped via the lobby line if he stayed alert.', '2026-04-20 11:45:15+00'),
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
