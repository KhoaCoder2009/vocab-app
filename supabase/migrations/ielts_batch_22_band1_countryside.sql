-- BATCH 22 | BAND 1.0 | TOPIC: Countryside | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Countryside' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Countryside',
       'Từ vựng IELTS chủ đề Countryside cho Band 1: làng quê, nông trại, cây trồng và cuộc sống yên bình.',
       'easy', true, 'green')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Countryside' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'countryside', 'vùng nông thôn', 'land outside towns with fields and villages', 'noun', '/ˈkʌntrisaɪd/',
     'I like the countryside because it is peaceful.', 'Tôi thích vùng nông thôn vì nó yên bình.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['in the countryside', 'beautiful countryside', 'visit the countryside'],
     array['rural area'],
     array['city'],
     array['country', 'side'],
     'Không đếm được: the countryside.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'village', 'ngôi làng', 'a very small town in the country', 'noun', '/ˈvɪlɪdʒ/',
     'My grandparents live in a small village.', 'Ông bà tôi sống ở một ngôi làng nhỏ.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['small village', 'fishing village', 'village life'],
     array['hamlet'],
     array['city'],
     array['villager', 'villagers'],
     'Village life là cuộc sống làng quê.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'villager', 'dân làng', 'a person who lives in a village', 'noun', '/ˈvɪlɪdʒər/',
     'The villagers are very friendly.', 'Dân làng rất thân thiện.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['local villagers', 'friendly villagers', 'villagers work'],
     array['resident'],
     array[]::text[],
     array['village'],
     'Thường dùng ở số nhiều: villagers.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'farmer', 'nông dân', 'a person who grows crops or keeps animals', 'noun', '/ˈfɑːrmər/',
     'The farmer gets up at five every morning.', 'Người nông dân dậy lúc năm giờ mỗi sáng.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['rice farmer', 'local farmer', 'farmer works'],
     array['grower'],
     array[]::text[],
     array['farm', 'farming'],
     'Rice farmer là nông dân trồng lúa.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'crop', 'cây trồng, vụ mùa', 'a plant grown for food', 'noun', '/krɑːp/',
     'Rice is the main crop in my area.', 'Lúa là cây trồng chính ở khu vực tôi.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['grow crops', 'main crop', 'good crop'],
     array['harvest'],
     array[]::text[],
     array['crops'],
     'Grow crops là trồng cây.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'harvest', 'thu hoạch', 'to pick crops when they are ready', 'verb', '/ˈhɑːrvɪst/',
     'Farmers harvest rice in autumn.', 'Nông dân thu hoạch lúa vào mùa thu.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['harvest rice', 'harvest time', 'good harvest'],
     array['gather'],
     array['plant'],
     array['harvester'],
     'Cũng là danh từ: a good harvest.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'buffalo', 'con trâu', 'a large farm animal with horns', 'noun', '/ˈbʌfəloʊ/',
     'A buffalo helps the farmer in the field.', 'Con trâu giúp người nông dân trên đồng.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['water buffalo', 'ride a buffalo', 'buffalo in the field'],
     array[]::text[],
     array[]::text[],
     array['buffaloes'],
     'Buffalo là hình ảnh quen thuộc của làng quê Việt Nam.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sheep', 'con cừu', 'a farm animal with thick wool', 'noun', '/ʃiːp/',
     'There are many sheep on the hill.', 'Có nhiều cừu trên đồi.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['flock of sheep', 'farm sheep', 'white sheep'],
     array[]::text[],
     array[]::text[],
     array['shepherd'],
     'Số ít và số nhiều đều là sheep.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'goat', 'con dê', 'a farm animal with horns', 'noun', '/ɡoʊt/',
     'The goat eats grass all day.', 'Con dê ăn cỏ cả ngày.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening'],
     array['farm goat', 'goat milk', 'wild goat'],
     array[]::text[],
     array[]::text[],
     array['goats'],
     'Goat milk là sữa dê.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'barn', 'nhà kho, chuồng trại', 'a large farm building for animals or crops', 'noun', '/bɑːrn/',
     'The cows sleep in the barn at night.', 'Những con bò ngủ trong chuồng vào ban đêm.',
     1.0, 'Countryside', 'A1', 'Reading (Farm).',
     array['Speaking', 'Listening', 'Reading'],
     array['old barn', 'red barn', 'in the barn'],
     array['shed'],
     array[]::text[],
     array['barns'],
     'Barn dùng nhiều trong bài đọc về nông trại.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'orchard', 'vườn cây ăn quả', 'a garden where fruit trees grow', 'noun', '/ˈɔːrtʃərd/',
     'My uncle has an apple orchard.', 'Chú tôi có một vườn táo.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['apple orchard', 'fruit orchard', 'pick fruit in an orchard'],
     array[]::text[],
     array[]::text[],
     array['orchards'],
     'Orchard là nơi trồng cây ăn quả.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pond', 'cái ao', 'a small area of water', 'noun', '/pɑːnd/',
     'Ducks swim on the pond.', 'Vịt bơi trên ao.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 (Countryside).',
     array['Speaking', 'Listening'],
     array['fish pond', 'small pond', 'village pond'],
     array[]::text[],
     array[]::text[],
     array['ponds'],
     'Pond nhỏ hơn lake.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'path', 'con đường mòn', 'a narrow way for walking', 'noun', '/pæθ/',
     'We walk along a path near the field.', 'Chúng tôi đi dọc một con đường mòn gần cánh đồng.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 (Countryside).',
     array['Speaking', 'Listening', 'Reading'],
     array['narrow path', 'walk along a path', 'footpath'],
     array['track', 'trail'],
     array[]::text[],
     array['pathway'],
     'Footpath là lối đi bộ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fence', 'hàng rào', 'a wall made of wood or wire around a place', 'noun', '/fens/',
     'There is a wooden fence around the garden.', 'Có một hàng rào gỗ quanh khu vườn.',
     1.0, 'Countryside', 'A1', 'Reading (Farm).',
     array['Speaking', 'Listening', 'Reading'],
     array['wooden fence', 'garden fence', 'high fence'],
     array['barrier'],
     array[]::text[],
     array['fencing'],
     'Fence in nghĩa là rào lại.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'gate', 'cổng', 'a door in a fence or wall outside', 'noun', '/ɡeɪt/',
     'Please close the gate.', 'Làm ơn đóng cổng lại.',
     1.0, 'Countryside', 'A1', 'Listening Section 1 and Section 2.',
     array['Speaking', 'Listening'],
     array['open the gate', 'close the gate', 'main gate'],
     array['entrance'],
     array[]::text[],
     array['gates'],
     'Gate còn là cổng lên máy bay ở sân bay.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cottage', 'nhà tranh, nhà nhỏ ở quê', 'a small house in the country', 'noun', '/ˈkɑːtɪdʒ/',
     'They live in a small cottage near the hill.', 'Họ sống trong một ngôi nhà nhỏ gần đồi.',
     1.0, 'Countryside', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['small cottage', 'stone cottage', 'cottage garden'],
     array['cabin'],
     array[]::text[],
     array['cottages'],
     'Cottage thường là nhà nhỏ, đẹp ở quê.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tractor', 'máy cày', 'a farm machine used for pulling heavy things', 'noun', '/ˈtræktər/',
     'The farmer uses a tractor in the field.', 'Người nông dân dùng máy cày trên đồng.',
     1.0, 'Countryside', 'A1', 'Reading (Farm).',
     array['Speaking', 'Listening', 'Reading'],
     array['drive a tractor', 'farm tractor', 'old tractor'],
     array[]::text[],
     array[]::text[],
     array['tractors'],
     'Drive a tractor là lái máy cày.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rural', 'thuộc nông thôn', 'connected with the countryside', 'adjective', '/ˈrʊrəl/',
     'Rural areas are quiet and green.', 'Các vùng nông thôn yên tĩnh và xanh.',
     1.0, 'Countryside', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['rural area', 'rural life', 'rural village'],
     array['country'],
     array['urban'],
     array['ruralism'],
     'Rural area đối lập với urban area.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'simple', 'đơn giản', 'easy or not complicated', 'adjective', '/ˈsɪmpl/',
     'Life in the village is simple.', 'Cuộc sống ở làng quê rất đơn giản.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['simple life', 'simple food', 'keep it simple'],
     array['plain', 'easy'],
     array['complicated'],
     array['simply', 'simplicity', 'simplify'],
     'Simple life là cuộc sống giản dị.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'calm', 'yên ả', 'quiet and without worry', 'adjective', '/kɑːm/',
     'The village is calm in the evening.', 'Ngôi làng yên ả vào buổi tối.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['calm place', 'stay calm', 'calm sea'],
     array['peaceful', 'quiet'],
     array['noisy', 'stressed'],
     array['calmly', 'calmness', 'calm'],
     'Stay calm là giữ bình tĩnh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'space', 'không gian', 'an empty area', 'noun', '/speɪs/',
     'The countryside has a lot of space.', 'Vùng quê có nhiều không gian.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['open space', 'lots of space', 'green space'],
     array['room', 'area'],
     array[]::text[],
     array['spacious', 'spaceship'],
     'Không đếm được khi nói về khoảng trống.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lifestyle', 'lối sống', 'the way that a person lives', 'noun', '/ˈlaɪfstaɪl/',
     'A quiet lifestyle suits me.', 'Lối sống yên tĩnh phù hợp với tôi.',
     1.0, 'Countryside', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['healthy lifestyle', 'rural lifestyle', 'modern lifestyle'],
     array['way of life'],
     array[]::text[],
     array['life', 'style'],
     'Healthy lifestyle là cụm rất quan trọng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'grow', 'trồng, lớn lên', 'to become bigger, or to plant and care for', 'verb', '/ɡroʊ/',
     'Farmers grow rice and vegetables.', 'Nông dân trồng lúa và rau.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['grow rice', 'grow up', 'grow vegetables'],
     array['cultivate'],
     array['shrink'],
     array['grew', 'grown', 'growth'],
     'Grow up nghĩa là lớn lên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'well', 'giếng', 'a deep hole for getting water', 'noun', '/wel/',
     'The village has an old well.', 'Ngôi làng có một cái giếng cổ.',
     1.0, 'Countryside', 'A1', 'Speaking Part 2 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['old well', 'water well', 'dig a well'],
     array[]::text[],
     array[]::text[],
     array['wells'],
     'Well còn là trạng từ: tốt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wheat', 'lúa mì', 'a plant grown for its grain used to make flour', 'noun', '/wiːt/',
     'Wheat is used to make bread.', 'Lúa mì được dùng để làm bánh mì.',
     1.0, 'Countryside', 'A1', 'Reading (Farm).',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['wheat field', 'grow wheat', 'wheat flour'],
     array['grain'],
     array[]::text[],
     array['wheaten'],
     'Wheat flour là bột mì.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'friendly', 'thân thiện', 'kind and pleasant to other people', 'adjective', '/ˈfrendli/',
     'The villagers are warm and friendly.', 'Dân làng ấm áp và thân thiện.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['friendly people', 'friendly atmosphere', 'friendly to'],
     array['welcoming', 'kind'],
     array['unfriendly'],
     array['friend', 'friendliness'],
     'Friendly to + đối tượng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'relaxing', 'thư giãn', 'making you feel calm and rested', 'adjective', '/rɪˈlæksɪŋ/',
     'A walk in the countryside is relaxing.', 'Đi dạo ở vùng quê rất thư giãn.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['relaxing place', 'relaxing weekend', 'very relaxing'],
     array['soothing'],
     array['stressful'],
     array['relax', 'relaxed', 'relaxation'],
     'Relaxing mô tả sự việc, relaxed mô tả người.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'spacious', 'rộng rãi', 'having a lot of space', 'adjective', '/ˈspeɪʃəs/',
     'The house in the countryside is spacious.', 'Ngôi nhà ở quê rất rộng rãi.',
     1.0, 'Countryside', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['spacious room', 'spacious house', 'spacious garden'],
     array['roomy'],
     array['cramped', 'small'],
     array['space', 'spaciously'],
     'Spacious dùng nhiều để mô tả nhà cửa.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pace', 'nhịp sống, tốc độ', 'the speed of moving or doing something', 'noun', '/peɪs/',
     'Life in the village has a slow pace.', 'Cuộc sống ở làng quê có nhịp độ chậm.',
     1.0, 'Countryside', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['slow pace', 'fast pace', 'pace of life'],
     array['speed', 'tempo'],
     array[]::text[],
     array['pacing'],
     'Pace of life là nhịp sống.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hay', 'cỏ khô', 'dry grass used as food for farm animals', 'noun', '/heɪ/',
     'The cows eat hay in winter.', 'Bò ăn cỏ khô vào mùa đông.',
     1.0, 'Countryside', 'A1', 'Reading (Farm).',
     array['Speaking', 'Listening', 'Reading'],
     array['dry hay', 'pile of hay', 'hay field'],
     array['fodder'],
     array[]::text[],
     array['haystack'],
     'Haystack là đống cỏ khô.')
  on conflict do nothing;

end $$;
