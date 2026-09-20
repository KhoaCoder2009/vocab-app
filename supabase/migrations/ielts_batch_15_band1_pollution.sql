-- BATCH 15 | BAND 1.0 | TOPIC: Pollution | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Pollution' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Pollution',
       'Từ vựng IELTS chủ đề Pollution cho Band 1: ô nhiễm không khí, nước, tiếng ồn và tác hại cơ bản.',
       'easy', true, 'red')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Pollution' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pollution', 'ô nhiễm', 'dirty or harmful things in air, water or land', 'noun', '/pəˈluːʃn/',
     'Air pollution is bad in big cities.', 'Ô nhiễm không khí rất nặng ở các thành phố lớn.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['air pollution', 'water pollution', 'noise pollution'],
     array['contamination'],
     array[]::text[],
     array['pollute', 'polluted', 'pollutant'],
     'Không đếm được: air pollution.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pollute', 'làm ô nhiễm', 'to make air, water or land dirty', 'verb', '/pəˈluːt/',
     'Factories pollute the river.', 'Các nhà máy làm ô nhiễm con sông.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['pollute the air', 'pollute the river', 'pollute water'],
     array['contaminate'],
     array['clean'],
     array['pollution', 'polluted', 'pollutant'],
     'Pollute + danh từ, không cần giới từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'noise', 'tiếng ồn', 'a loud or unpleasant sound', 'noun', '/nɔɪz/',
     'Traffic noise wakes me up at night.', 'Tiếng ồn giao thông đánh thức tôi vào ban đêm.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening', 'Writing'],
     array['loud noise', 'noise pollution', 'make a noise'],
     array['sound'],
     array['silence'],
     array['noisy', 'noiseless'],
     'Noise pollution là ô nhiễm tiếng ồn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'loud', 'to, ồn', 'making a lot of noise', 'adjective', '/laʊd/',
     'The music is too loud.', 'Tiếng nhạc quá to.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['loud noise', 'loud music', 'in a loud voice'],
     array['noisy'],
     array['quiet', 'soft'],
     array['loudly', 'loudspeaker'],
     'Loud là tính từ, loudly là trạng từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'quiet', 'yên tĩnh', 'making very little noise', 'adjective', '/ˈkwaɪət/',
     'I like a quiet place to study.', 'Tôi thích một nơi yên tĩnh để học.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening', 'Writing'],
     array['quiet place', 'quiet street', 'keep quiet'],
     array['calm', 'peaceful'],
     array['noisy', 'loud'],
     array['quietly', 'quietness', 'quieten'],
     'Cần phân biệt quiet /ˈkwaɪət/ và quite /kwaɪt/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'smell', 'mùi, ngửi', 'a quality that you sense with your nose', 'noun', '/smel/',
     'The smell from the factory is terrible.', 'Mùi từ nhà máy rất khủng khiếp.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['bad smell', 'strong smell', 'smell of'],
     array['odour', 'scent'],
     array[]::text[],
     array['smelly', 'smelling'],
     'Cũng là động từ: It smells bad.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'traffic', 'giao thông', 'cars and other vehicles on the road', 'noun', '/ˈtræfɪk/',
     'Traffic is heavy in the morning.', 'Giao thông rất đông vào buổi sáng.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['heavy traffic', 'traffic jam', 'traffic noise'],
     array[]::text[],
     array[]::text[],
     array['trafficker'],
     'Không đếm được: heavy traffic.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'factory', 'nhà máy', 'a building where things are made', 'noun', '/ˈfæktri/',
     'The factory is near the river.', 'Nhà máy nằm gần con sông.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['work in a factory', 'factory worker', 'factory waste'],
     array['plant'],
     array[]::text[],
     array['factories'],
     'Factory worker là công nhân nhà máy.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chemical', 'hoá chất', 'a substance used in chemistry', 'noun', '/ˈkemɪkl/',
     'The factory puts chemicals into the water.', 'Nhà máy xả hoá chất vào nước.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['harmful chemicals', 'chemical waste', 'chemical industry'],
     array['substance'],
     array[]::text[],
     array['chemistry', 'chemist'],
     'Cũng là tính từ: chemical waste.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'river', 'dòng sông', 'a large natural flow of water', 'noun', '/ˈrɪvər/',
     'The river is dirty because of rubbish.', 'Dòng sông bẩn vì rác.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['clean the river', 'polluted river', 'river bank'],
     array['stream'],
     array[]::text[],
     array['riverside', 'riverbank'],
     'Riverside là bờ sông.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lake', 'hồ', 'a large area of water surrounded by land', 'noun', '/leɪk/',
     'We walk around the lake in the evening.', 'Buổi tối chúng tôi đi dạo quanh hồ.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening'],
     array['clean lake', 'lake water', 'walk around the lake'],
     array['pond'],
     array[]::text[],
     array['lakeside'],
     'Lake nhỏ hơn sea.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'soil', 'đất', 'the top layer of earth where plants grow', 'noun', '/sɔɪl/',
     'Chemicals can damage the soil.', 'Hoá chất có thể làm hỏng đất.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['rich soil', 'poor soil', 'soil pollution'],
     array['earth', 'ground'],
     array[]::text[],
     array['soiled'],
     'Soil pollution là ô nhiễm đất.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'poison', 'chất độc', 'a substance that can kill or make people ill', 'noun', '/ˈpɔɪzn/',
     'The river has poison from the factory.', 'Con sông có chất độc từ nhà máy.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['deadly poison', 'poison the water', 'poison gas'],
     array['toxin'],
     array['antidote'],
     array['poisonous', 'poisoning'],
     'Cũng là động từ: poison the river.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dust', 'bụi', 'very small dry pieces of dirt', 'noun', '/dʌst/',
     'Dust from the road makes me cough.', 'Bụi từ đường khiến tôi ho.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['thick dust', 'dust storm', 'clean the dust'],
     array['dirt'],
     array[]::text[],
     array['dusty', 'dustbin'],
     'Dusty là tính từ: nhiều bụi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fog', 'sương mù', 'thick cloud near the ground', 'noun', '/fɑːɡ/',
     'Fog and smoke cover the city.', 'Sương mù và khói bao phủ thành phố.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Reading'],
     array['thick fog', 'morning fog', 'fog and smoke'],
     array['mist'],
     array[]::text[],
     array['foggy'],
     'Fog là sương mù dày hơn mist.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'mask', 'khẩu trang', 'a cover you wear over your face', 'noun', '/mæsk/',
     'I wear a mask when the air is bad.', 'Tôi đeo khẩu trang khi không khí xấu.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Health).',
     array['Speaking', 'Listening'],
     array['wear a mask', 'face mask', 'take off a mask'],
     array['face cover'],
     array[]::text[],
     array['masked'],
     'Face mask là khẩu trang.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'breathe', 'thở', 'to take air into your body', 'verb', '/briːð/',
     'It is hard to breathe in the smoke.', 'Thật khó thở trong khói.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['breathe in', 'breathe out', 'breathe deeply'],
     array['inhale'],
     array['hold breath'],
     array['breath', 'breathing', 'breathless'],
     'Breathe là động từ /briːð/, breath là danh từ /breθ/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'kill', 'giết, làm chết', 'to make a person or animal die', 'verb', '/kɪl/',
     'Air pollution can kill people.', 'Ô nhiễm không khí có thể giết người.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['kill animals', 'kill people', 'kill time'],
     array['destroy'],
     array['save'],
     array['killer', 'killing'],
     'Kill time nghĩa là giết thời gian.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fumes', 'khói độc', 'strong, unpleasant gas or smoke', 'noun', '/fjuːmz/',
     'The car fumes are harmful.', 'Khói xe rất có hại.',
     1.0, 'Pollution', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['car fumes', 'exhaust fumes', 'toxic fumes'],
     array['smoke', 'gas'],
     array[]::text[],
     array['fume'],
     'Thường dùng ở số nhiều.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'engine', 'động cơ', 'a machine that makes something move', 'noun', '/ˈendʒɪn/',
     'A big engine makes a lot of noise.', 'Động cơ lớn tạo ra nhiều tiếng ồn.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['car engine', 'start the engine', 'engine noise'],
     array['motor'],
     array[]::text[],
     array['engineer', 'engineering'],
     'Engine nhấn âm đầu: EN-gine.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'exhaust', 'khí thải', 'gas that comes out of an engine', 'noun', '/ɪɡˈzɔːst/',
     'Car exhaust makes the air dirty.', 'Khí thải xe hơi làm không khí bẩn.',
     1.0, 'Pollution', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['exhaust fumes', 'car exhaust', 'exhaust pipe'],
     array['emissions'],
     array[]::text[],
     array['exhausted', 'exhausting'],
     'Exhaust còn là động từ: làm kiệt sức.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'motorbike', 'xe máy', 'a two-wheeled vehicle with an engine', 'noun', '/ˈmoʊtərbaɪk/',
     'Many people in my city ride motorbikes.', 'Nhiều người ở thành phố tôi đi xe máy.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 (Transport).',
     array['Speaking', 'Listening', 'Writing'],
     array['ride a motorbike', 'motorbike taxi', 'motorbike engine'],
     array['motorcycle'],
     array[]::text[],
     array['motorcyclist', 'motor'],
     'Xe máy rất phổ biến ở Việt Nam, đáng dùng khi mô tả giao thông.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ban', 'cấm', 'to say that something is not allowed', 'verb', '/bæn/',
     'The city bans plastic bags.', 'Thành phố cấm túi nhựa.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['ban plastic bags', 'ban smoking', 'ban on'],
     array['forbid', 'prohibit'],
     array['allow'],
     array['banned', 'banning'],
     'Cũng là danh từ: a ban on smoking.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fine', 'tiền phạt', 'money you pay as a punishment', 'noun', '/faɪn/',
     'You pay a fine if you drop litter.', 'Bạn bị phạt tiền nếu xả rác.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['pay a fine', 'heavy fine', 'get a fine'],
     array['penalty'],
     array[]::text[],
     array['fined'],
     'Fine còn là tính từ: tốt, ổn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'filter', 'bộ lọc', 'a device that cleans air or water', 'noun', '/ˈfɪltər/',
     'We use a filter to clean the water.', 'Chúng tôi dùng bộ lọc để làm sạch nước.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['water filter', 'air filter', 'use a filter'],
     array[]::text[],
     array[]::text[],
     array['filtered', 'filtration'],
     'Cũng là động từ: filter the water.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'harmful', 'có hại', 'causing damage or illness', 'adjective', '/ˈhɑːrmfl/',
     'Smoke is harmful to our health.', 'Khói có hại cho sức khoẻ của chúng ta.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['harmful to', 'harmful effects', 'harmful chemicals'],
     array['damaging', 'dangerous'],
     array['harmless', 'beneficial'],
     array['harm', 'harmfully'],
     'Harmful to + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'toxic', 'độc hại', 'containing poison', 'adjective', '/ˈtɑːksɪk/',
     'Toxic smoke comes from the factory.', 'Khói độc hại bay ra từ nhà máy.',
     1.0, 'Pollution', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['toxic waste', 'toxic gas', 'toxic chemicals'],
     array['poisonous'],
     array['harmless'],
     array['toxin', 'toxicity'],
     'Toxic waste là chất thải độc hại.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'effect', 'ảnh hưởng, tác động', 'a change caused by something', 'noun', '/ɪˈfekt/',
     'Pollution has a bad effect on health.', 'Ô nhiễm có tác động xấu đến sức khoẻ.',
     1.0, 'Pollution', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['bad effect', 'have an effect on', 'side effect'],
     array['impact', 'influence'],
     array['cause'],
     array['effective', 'effectively', 'effectiveness'],
     'Effect là danh từ, affect là động từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'smog', 'khói bụi ô nhiễm', 'dirty air made of smoke and fog', 'noun', '/smɑːɡ/',
     'Smog covers the city in winter.', 'Khói bụi bao phủ thành phố vào mùa đông.',
     1.0, 'Pollution', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['thick smog', 'heavy smog', 'city smog'],
     array[]::text[],
     array[]::text[],
     array['smoggy'],
     'Smog = smoke + fog.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'crowded', 'đông đúc', 'full of people', 'adjective', '/ˈkraʊdɪd/',
     'The road is crowded in the morning.', 'Đường đông đúc vào buổi sáng.',
     1.0, 'Pollution', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['crowded street', 'crowded bus', 'overcrowded'],
     array['packed'],
     array['empty'],
     array['crowd', 'overcrowded'],
     'Crowded with + danh từ.')
  on conflict do nothing;

end $$;
