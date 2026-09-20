-- BATCH 6 | BAND 1.0 | TOPIC: Sports | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Sports' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Sports',
       'Từ vựng IELTS chủ đề Sports cho Band 1: môn thể thao, động tác và trận đấu cơ bản.',
       'easy', true, 'red')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Sports' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sport', 'môn thể thao', 'a physical activity done for fun or competition', 'noun', '/spɔːrt/',
     'Football is my favourite sport.', 'Bóng đá là môn thể thao yêu thích của tôi.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening', 'Writing'],
     array['play a sport', 'favourite sport', 'team sport'],
     array['game'],
     array[]::text[],
     array['sporty', 'sports', 'sportsman'],
     'Sport là đếm được, sports dùng như tính từ: sports club.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'football', 'bóng đá', 'a game where two teams kick a ball to score goals', 'noun', '/ˈfʊtbɔːl/',
     'I play football with my friends.', 'Tôi chơi bóng đá với bạn bè.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['play football', 'football match', 'football team'],
     array['soccer'],
     array[]::text[],
     array['footballer'],
     'Anh-Mỹ gọi bóng đá là soccer.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'basketball', 'bóng rổ', 'a game where players throw a ball into a high net', 'noun', '/ˈbæskɪtbɔːl/',
     'He plays basketball after school.', 'Cậu ấy chơi bóng rổ sau giờ học.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['play basketball', 'basketball court', 'basketball team'],
     array[]::text[],
     array[]::text[],
     array['basket', 'ball'],
     'Không dùng mạo từ: play basketball.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tennis', 'quần vợt', 'a game played with rackets and a small ball', 'noun', '/ˈtenɪs/',
     'My mother plays tennis on Sundays.', 'Mẹ tôi chơi quần vợt vào Chủ nhật.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['play tennis', 'tennis court', 'tennis player'],
     array[]::text[],
     array[]::text[],
     array['tennis ball'],
     'Tennis là môn thể thao dùng vợt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'badminton', 'cầu lông', 'a game played with rackets and a light shuttlecock', 'noun', '/ˈbædmɪntən/',
     'We play badminton in the park.', 'Chúng tôi chơi cầu lông trong công viên.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['play badminton', 'badminton racket', 'badminton court'],
     array[]::text[],
     array[]::text[],
     array['shuttlecock'],
     'Cầu lông rất phổ biến ở Việt Nam.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'volleyball', 'bóng chuyền', 'a game where teams hit a ball over a net', 'noun', '/ˈvɑːlibɔːl/',
     'Our class plays volleyball on Fridays.', 'Lớp chúng tôi chơi bóng chuyền vào thứ Sáu.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['play volleyball', 'volleyball team', 'volleyball match'],
     array[]::text[],
     array[]::text[],
     array['volley', 'ball'],
     'Volleyball là môn thể thao đồng đội.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'swim', 'bơi', 'to move through water using your body', 'verb', '/swɪm/',
     'I swim in the pool every weekend.', 'Tôi bơi ở hồ bơi mỗi cuối tuần.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['swim in the sea', 'go swimming', 'swim fast'],
     array[]::text[],
     array[]::text[],
     array['swam', 'swum', 'swimmer', 'swimming'],
     'Go swimming là cách nói tự nhiên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'run', 'chạy', 'to move fast on your feet', 'verb', '/rʌn/',
     'I run in the park every morning.', 'Tôi chạy bộ trong công viên mỗi sáng.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening', 'Writing'],
     array['run fast', 'go for a run', 'run away'],
     array['jog'],
     array['walk'],
     array['ran', 'runner', 'running'],
     'Run còn có nghĩa là điều hành: run a business.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'jump', 'nhảy', 'to push your body off the ground', 'verb', '/dʒʌmp/',
     'She can jump very high.', 'Cô ấy có thể nhảy rất cao.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['jump high', 'jump over', 'high jump'],
     array['leap'],
     array[]::text[],
     array['jumper', 'jumping'],
     'Jump over nghĩa là nhảy qua.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'kick', 'đá', 'to hit something with your foot', 'verb', '/kɪk/',
     'He kicks the ball to his friend.', 'Cậu ấy đá quả bóng cho bạn.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['kick a ball', 'kick off', 'kick hard'],
     array[]::text[],
     array[]::text[],
     array['kicker', 'kick-off'],
     'Cũng là danh từ: a kick.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'throw', 'ném', 'to send something through the air with your hand', 'verb', '/θroʊ/',
     'Throw the ball to me, please.', 'Hãy ném bóng cho tôi.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['throw a ball', 'throw away', 'throw far'],
     array['toss'],
     array['catch'],
     array['threw', 'thrown', 'thrower'],
     'Throw away nghĩa là vứt đi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'catch', 'bắt', 'to take something that is moving through the air', 'verb', '/kætʃ/',
     'I catch the ball with both hands.', 'Tôi bắt bóng bằng hai tay.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['catch a ball', 'catch a cold', 'catch a bus'],
     array['grab'],
     array['throw'],
     array['caught', 'catcher'],
     'Catch còn dùng cho bắt xe: catch a bus.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ball', 'quả bóng', 'a round object used in many games', 'noun', '/bɔːl/',
     'The children kick the ball in the yard.', 'Bọn trẻ đá bóng trong sân.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['kick a ball', 'throw a ball', 'tennis ball'],
     array[]::text[],
     array[]::text[],
     array['ballroom', 'football'],
     'Ball cũng là buổi dạ hội (a ball).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'team', 'đội', 'a group of people who play or work together', 'noun', '/tiːm/',
     'Our team wins every match.', 'Đội chúng tôi thắng mọi trận.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening', 'Writing'],
     array['football team', 'team member', 'join a team'],
     array['squad'],
     array[]::text[],
     array['teamwork', 'teammate'],
     'Teamwork là kỹ năng quan trọng trong công việc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'player', 'người chơi, cầu thủ', 'a person who plays a sport or game', 'noun', '/ˈpleɪər/',
     'He is a good football player.', 'Cậu ấy là một cầu thủ giỏi.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['football player', 'tennis player', 'good player'],
     array['athlete'],
     array[]::text[],
     array['play', 'playful'],
     'Player cũng chỉ người chơi nhạc (a piano player).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'match', 'trận đấu', 'a sports game between two teams or players', 'noun', '/mætʃ/',
     'We watch the match on television.', 'Chúng tôi xem trận đấu trên tivi.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['football match', 'watch a match', 'win a match'],
     array['game', 'contest'],
     array[]::text[],
     array['matching'],
     'Match cũng là động từ: match colours.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'win', 'thắng', 'to be the best in a game or competition', 'verb', '/wɪn/',
     'Our team wants to win the match.', 'Đội chúng tôi muốn thắng trận đấu.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['win a game', 'win a prize', 'win the match'],
     array['triumph'],
     array['lose'],
     array['won', 'winner', 'winning'],
     'Quá khứ là won /wʌn/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lose', 'thua', 'to fail to win', 'verb', '/luːz/',
     'We lose the game by one goal.', 'Chúng tôi thua trận với cách biệt một bàn.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['lose a game', 'lose a match', 'lose money'],
     array['fail'],
     array['win'],
     array['lost', 'loser', 'loss'],
     'Lose còn nghĩa là đánh mất: lose a key.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'goal', 'bàn thắng', 'a point scored in a game like football', 'noun', '/ɡoʊl/',
     'He scores a goal in the last minute.', 'Cậu ấy ghi bàn ở phút cuối.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening', 'Writing'],
     array['score a goal', 'goal keeper', 'win by one goal'],
     array['target'],
     array[]::text[],
     array['goalkeeper'],
     'Goal còn là mục tiêu trong cuộc sống.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'score', 'ghi điểm, tỉ số', 'to get a point in a game', 'verb', '/skɔːr/',
     'She scores three points in the game.', 'Cô ấy ghi ba điểm trong trận đấu.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening', 'Writing'],
     array['score a goal', 'final score', 'high score'],
     array['earn'],
     array[]::text[],
     array['scorer', 'scoreboard'],
     'Cũng là danh từ: The score is 2-1.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'coach', 'huấn luyện viên', 'a person who teaches sport skills', 'noun', '/koʊtʃ/',
     'Our coach is strict but kind.', 'Huấn luyện viên của chúng tôi nghiêm khắc nhưng tốt bụng.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['football coach', 'tennis coach', 'good coach'],
     array['trainer'],
     array['player'],
     array['coaching'],
     'Coach còn là xe khách đường dài (Anh-Anh).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'exercise', 'tập thể dục', 'to do physical activity to stay healthy', 'verb', '/ˈeksərsaɪz/',
     'I exercise for thirty minutes every day.', 'Tôi tập thể dục ba mươi phút mỗi ngày.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['do exercise', 'take exercise', 'regular exercise'],
     array['work out'],
     array[]::text[],
     array['exerciser'],
     'Cũng là danh từ: Exercise is good for health.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'gym', 'phòng tập thể hình', 'a place with equipment for exercise', 'noun', '/dʒɪm/',
     'My brother goes to the gym after work.', 'Anh trai tôi đến phòng tập sau giờ làm.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['go to the gym', 'join a gym', 'gym membership'],
     array['fitness centre'],
     array[]::text[],
     array['gymnastics', 'gymnast'],
     'Gym là dạng viết ngắn của gymnasium.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'race', 'cuộc đua', 'a competition to see who is fastest', 'noun', '/reɪs/',
     'I take part in a school race.', 'Tôi tham gia một cuộc đua ở trường.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['run a race', 'win a race', 'horse race'],
     array['competition'],
     array[]::text[],
     array['racer', 'racing'],
     'Race còn có nghĩa là chủng tộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fast', 'nhanh', 'moving or happening at high speed', 'adjective', '/fæst/',
     'He is a fast runner.', 'Cậu ấy là một người chạy nhanh.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['fast runner', 'run fast', 'fast food'],
     array['quick', 'rapid'],
     array['slow'],
     array['faster', 'fastest', 'fasten'],
     'Fast vừa là tính từ vừa là trạng từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'slow', 'chậm', 'not moving quickly', 'adjective', '/sloʊ/',
     'I am slow but I never stop.', 'Tôi chậm nhưng không bao giờ bỏ cuộc.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['slow down', 'slow runner', 'slow start'],
     array['sluggish'],
     array['fast', 'quick'],
     array['slowly', 'slowness'],
     'Slow down nghĩa là giảm tốc độ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'strong', 'khoẻ, mạnh', 'having great physical power', 'adjective', '/strɔːŋ/',
     'My father is strong and healthy.', 'Bố tôi khoẻ mạnh.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['strong player', 'get stronger', 'strong wind'],
     array['powerful'],
     array['weak'],
     array['strength', 'strengthen', 'strongly'],
     'Strong còn mô tả mùi vị hoặc ý kiến mạnh mẽ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pool', 'hồ bơi', 'a place filled with water for swimming', 'noun', '/puːl/',
     'We swim in the pool on Sundays.', 'Chúng tôi bơi ở hồ bơi vào Chủ nhật.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening'],
     array['swimming pool', 'pool party', 'public pool'],
     array[]::text[],
     array[]::text[],
     array['poolside'],
     'Swimming pool là cách nói đầy đủ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cycle', 'đạp xe', 'to ride a bicycle', 'verb', '/ˈsaɪkl/',
     'I cycle to school every day.', 'Tôi đạp xe đến trường mỗi ngày.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening', 'Writing'],
     array['cycle to school', 'go cycling', 'cycle lane'],
     array['ride a bike'],
     array[]::text[],
     array['cyclist', 'cycling', 'bicycle'],
     'Cũng là danh từ: a life cycle.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stadium', 'sân vận động', 'a large place where sports events happen', 'noun', '/ˈsteɪdiəm/',
     'The stadium is full of fans.', 'Sân vận động đông kín người hâm mộ.',
     1.0, 'Sports', 'A1', 'Speaking Part 1 (Sports).',
     array['Speaking', 'Listening', 'Reading'],
     array['football stadium', 'in the stadium', 'crowded stadium'],
     array['arena'],
     array[]::text[],
     array['stadiums'],
     'Nghĩa gốc là sân thi đấu lớn ngoài trời.')
  on conflict do nothing;

end $$;
