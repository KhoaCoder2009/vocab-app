-- BATCH 4 | BAND 1.0 | TOPIC: Daily Life | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Daily Life' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Daily Life',
       'Từ vựng IELTS chủ đề Daily Life cho Band 1: thói quen hằng ngày, bữa ăn và trạng từ chỉ tần suất.',
       'easy', true, 'orange')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Daily Life' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'morning', 'buổi sáng', 'the early part of the day', 'noun', '/ˈmɔːrnɪŋ/',
     'I drink tea every morning.', 'Tôi uống trà mỗi buổi sáng.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['in the morning', 'every morning', 'early morning'],
     array['dawn'],
     array['evening', 'night'],
     array['mornings'],
     'Chào buổi sáng: Good morning.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'afternoon', 'buổi chiều', 'the time between noon and evening', 'noun', '/ˌæftərˈnuːn/',
     'I study in the afternoon.', 'Tôi học vào buổi chiều.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['in the afternoon', 'this afternoon', 'afternoon tea'],
     array[]::text[],
     array[]::text[],
     array['noon', 'afternoons'],
     'Dùng giới từ in: in the afternoon.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'evening', 'buổi tối', 'the time between afternoon and night', 'noun', '/ˈiːvnɪŋ/',
     'We eat dinner together in the evening.', 'Chúng tôi ăn tối cùng nhau vào buổi tối.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['in the evening', 'every evening', 'this evening'],
     array['dusk'],
     array['morning'],
     array['evenings'],
     'Good evening dùng khi chào buổi tối.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'night', 'ban đêm', 'the time when it is dark', 'noun', '/naɪt/',
     'I go to bed early at night.', 'Tôi đi ngủ sớm vào ban đêm.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['at night', 'last night', 'good night'],
     array['nighttime'],
     array['day'],
     array['nightly', 'tonight'],
     'Dùng at night, không dùng in night.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'weekend', 'cuối tuần', 'Saturday and Sunday', 'noun', '/ˈwiːkend/',
     'I relax at home at the weekend.', 'Tôi thư giãn ở nhà vào cuối tuần.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening'],
     array['at the weekend', 'on weekends', 'long weekend'],
     array[]::text[],
     array[]::text[],
     array['weekday'],
     'Anh-Anh dùng at the weekend, Anh-Mỹ dùng on the weekend.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'routine', 'thói quen hằng ngày', 'the usual way you do things every day', 'noun', '/ruːˈtiːn/',
     'My morning routine is simple.', 'Thói quen buổi sáng của tôi rất đơn giản.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening', 'Writing'],
     array['daily routine', 'morning routine', 'follow a routine'],
     array['habit'],
     array['change'],
     array['routinely'],
     'Cụm daily routine xuất hiện rất nhiều trong Speaking.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'breakfast', 'bữa sáng', 'the first meal of the day', 'noun', '/ˈbrekfəst/',
     'I have breakfast at seven.', 'Tôi ăn sáng lúc bảy giờ.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['have breakfast', 'eat breakfast', 'skip breakfast'],
     array[]::text[],
     array[]::text[],
     array['breakfasts'],
     'Không dùng mạo từ: have breakfast.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lunch', 'bữa trưa', 'a meal in the middle of the day', 'noun', '/lʌntʃ/',
     'We eat lunch at school.', 'Chúng tôi ăn trưa ở trường.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['have lunch', 'lunch break', 'school lunch'],
     array[]::text[],
     array[]::text[],
     array['luncheon'],
     'Lunch break là giờ nghỉ trưa.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dinner', 'bữa tối', 'the main meal of the evening', 'noun', '/ˈdɪnər/',
     'My mother cooks dinner every day.', 'Mẹ tôi nấu bữa tối mỗi ngày.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['have dinner', 'cook dinner', 'family dinner'],
     array['supper'],
     array[]::text[],
     array['dinners'],
     'Ở một số vùng dinner có thể là bữa trưa chính.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wake', 'thức dậy', 'to stop sleeping', 'verb', '/weɪk/',
     'I wake up at six o''clock.', 'Tôi thức dậy lúc sáu giờ.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['wake up', 'wake up early', 'wake someone up'],
     array['get up'],
     array['sleep'],
     array['woke', 'woken', 'awake'],
     'Thường đi với up: wake up.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sleep', 'ngủ', 'to rest with your eyes closed', 'verb', '/sliːp/',
     'I sleep for eight hours every night.', 'Tôi ngủ tám tiếng mỗi đêm.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening', 'Writing'],
     array['sleep well', 'go to sleep', 'sleep late'],
     array['rest', 'doze'],
     array['wake'],
     array['sleepy', 'sleepless', 'asleep'],
     'Cũng là danh từ: get enough sleep.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'shower', 'tắm vòi sen', 'to wash your body under running water', 'noun', '/ˈʃaʊər/',
     'I take a shower before breakfast.', 'Tôi tắm vòi sen trước bữa sáng.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['take a shower', 'have a shower', 'hot shower'],
     array['wash'],
     array[]::text[],
     array['showers'],
     'Anh-Anh: have a shower, Anh-Mỹ: take a shower.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'brush', 'đánh răng, chải', 'to clean or tidy with a brush', 'verb', '/brʌʃ/',
     'I brush my teeth twice a day.', 'Tôi đánh răng hai lần mỗi ngày.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['brush teeth', 'brush hair', 'toothbrush'],
     array['clean'],
     array[]::text[],
     array['brushing'],
     'Cũng là danh từ: a brush.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dress', 'mặc quần áo', 'to put on clothes', 'verb', '/dres/',
     'I dress quickly in the morning.', 'Tôi mặc quần áo nhanh vào buổi sáng.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Clothes).',
     array['Speaking', 'Listening'],
     array['get dressed', 'dress well', 'dress up'],
     array['put on'],
     array['undress'],
     array['dresser', 'dressing'],
     'Get dressed rất tự nhiên hơn dress khi nói.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'eat', 'ăn', 'to put food in your mouth and swallow', 'verb', '/iːt/',
     'We eat rice for lunch.', 'Chúng tôi ăn cơm vào bữa trưa.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['eat out', 'eat healthy food', 'eat breakfast'],
     array['have'],
     array[]::text[],
     array['ate', 'eaten', 'eating'],
     'Eat out nghĩa là ăn ngoài.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'drink', 'uống', 'to take liquid into your mouth and swallow', 'verb', '/drɪŋk/',
     'I drink water after class.', 'Tôi uống nước sau giờ học.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['drink water', 'drink tea', 'have a drink'],
     array['sip'],
     array[]::text[],
     array['drank', 'drunk', 'drinker'],
     'Cũng là danh từ: a cold drink.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cook', 'nấu ăn', 'to make food ready to eat', 'verb', '/kʊk/',
     'My father cooks on Sundays.', 'Bố tôi nấu ăn vào Chủ nhật.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['cook dinner', 'cook at home', 'cook for family'],
     array['prepare food'],
     array[]::text[],
     array['cooker', 'cooking'],
     'Cook cũng là danh từ chỉ đầu bếp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'clean', 'dọn dẹp', 'to remove dirt from something', 'verb', '/kliːn/',
     'I clean my room every weekend.', 'Tôi dọn phòng mỗi cuối tuần.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['clean the house', 'clean up', 'clean my room'],
     array['tidy'],
     array['dirty', 'mess up'],
     array['cleaner', 'cleaning', 'cleanly'],
     'Cũng là tính từ: a clean room.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wash', 'rửa', 'to clean with water', 'verb', '/wɑːʃ/',
     'I wash the dishes after dinner.', 'Tôi rửa bát sau bữa tối.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['wash the dishes', 'wash your hands', 'wash clothes'],
     array['rinse'],
     array[]::text[],
     array['washing', 'washer'],
     'Wash up nghĩa là rửa bát (Anh-Anh).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bed', 'cái giường', 'a piece of furniture for sleeping', 'noun', '/bed/',
     'I go to bed at ten.', 'Tôi đi ngủ lúc mười giờ.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['go to bed', 'make the bed', 'bedtime'],
     array[]::text[],
     array[]::text[],
     array['bedroom', 'bedtime'],
     'Go to bed không dùng mạo từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'kitchen', 'nhà bếp', 'a room where food is cooked', 'noun', '/ˈkɪtʃɪn/',
     'My mother is in the kitchen.', 'Mẹ tôi đang ở trong bếp.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['in the kitchen', 'kitchen table', 'small kitchen'],
     array[]::text[],
     array[]::text[],
     array['kitchenware'],
     'Thường được hỏi trong chủ đề Home.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'television', 'ti vi', 'a machine for watching programmes', 'noun', '/ˈtelɪvɪʒn/',
     'We watch television after dinner.', 'Chúng tôi xem ti vi sau bữa tối.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening'],
     array['watch television', 'television programme', 'turn on the television'],
     array['TV', 'telly'],
     array[]::text[],
     array['televise'],
     'Thường viết tắt là TV.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'watch', 'xem', 'to look at something for some time', 'verb', '/wɑːtʃ/',
     'I watch a film with my family.', 'Tôi xem phim cùng gia đình.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening'],
     array['watch TV', 'watch a film', 'watch carefully'],
     array['view', 'look at'],
     array[]::text[],
     array['watcher', 'watchful'],
     'Watch TV, không dùng see TV.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'early', 'sớm', 'near the beginning of a period of time', 'adverb', '/ˈɜːrli/',
     'I get up early on school days.', 'Tôi dậy sớm vào những ngày đi học.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['get up early', 'early morning', 'early bird'],
     array['promptly'],
     array['late'],
     array['earlier', 'earliest'],
     'Early bird là người dậy sớm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'late', 'muộn', 'after the expected or usual time', 'adverb', '/leɪt/',
     'I go to bed late on Fridays.', 'Tôi đi ngủ muộn vào thứ Sáu.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Routine).',
     array['Speaking', 'Listening'],
     array['stay up late', 'late at night', 'be late'],
     array['behind schedule'],
     array['early'],
     array['later', 'lately', 'latest'],
     'Late khác lately (gần đây).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'always', 'luôn luôn', 'every time', 'adverb', '/ˈɔːlweɪz/',
     'I always have tea in the morning.', 'Tôi luôn uống trà vào buổi sáng.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Frequency).',
     array['Speaking', 'Listening', 'Writing'],
     array['always be on time', 'almost always', 'always available'],
     array['constantly'],
     array['never'],
     array[]::text[],
     'Đứng trước động từ thường, sau to be.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'usually', 'thường thường', 'in most cases', 'adverb', '/ˈjuːʒuəli/',
     'I usually walk to school.', 'Tôi thường đi bộ đến trường.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Frequency).',
     array['Speaking', 'Listening', 'Writing'],
     array['usually go', 'usually happen', 'as usual'],
     array['normally', 'generally'],
     array['rarely'],
     array['usual', 'unusual'],
     'As usual nghĩa là như thường lệ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sometimes', 'đôi khi', 'on some occasions but not always', 'adverb', '/ˈsʌmtaɪmz/',
     'Sometimes I cook dinner for my family.', 'Đôi khi tôi nấu bữa tối cho gia đình.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Frequency).',
     array['Speaking', 'Listening', 'Writing'],
     array['sometimes go', 'only sometimes', 'sometimes happen'],
     array['occasionally'],
     array['always', 'never'],
     array['some', 'time'],
     'Có thể đứng đầu câu: Sometimes...')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'busy', 'bận rộn', 'having a lot to do', 'adjective', '/ˈbɪzi/',
     'I am busy on weekdays.', 'Tôi bận vào các ngày trong tuần.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Daily Life).',
     array['Speaking', 'Listening', 'Writing'],
     array['busy day', 'busy schedule', 'busy with'],
     array['occupied'],
     array['free', 'idle'],
     array['busily', 'business'],
     'Busy with something hoặc busy doing something.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tired', 'mệt', 'needing rest or sleep', 'adjective', '/ˈtaɪərd/',
     'I feel tired after school.', 'Tôi cảm thấy mệt sau giờ học.',
     1.0, 'Daily Life', 'A1', 'Speaking Part 1 (Feelings).',
     array['Speaking', 'Listening'],
     array['feel tired', 'tired of', 'very tired'],
     array['exhausted', 'sleepy'],
     array['energetic'],
     array['tire', 'tiring', 'tireless'],
     'Tired of nghĩa là chán ngán điều gì.')
  on conflict do nothing;

end $$;
