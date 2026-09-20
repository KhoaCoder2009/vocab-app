-- BATCH 14 | BAND 1.0 | TOPIC: Climate Change | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Climate Change' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Climate Change',
       'Từ vựng IELTS chủ đề Climate Change cho Band 1: thời tiết, mùa, thiên tai và sự nóng lên toàn cầu ở mức cơ bản.',
       'easy', true, 'blue')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Climate Change' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'climate', 'khí hậu', 'the usual weather in a place', 'noun', '/ˈklaɪmət/',
     'The climate here is hot and wet.', 'Khí hậu ở đây nóng và ẩm.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['tropical climate', 'climate change', 'warm climate'],
     array['weather pattern'],
     array[]::text[],
     array['climatic', 'climatology'],
     'Climate là khí hậu dài hạn, weather là thời tiết ngắn hạn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'weather', 'thời tiết', 'the condition of the air, rain, wind and sun', 'noun', '/ˈweðər/',
     'The weather is hot today.', 'Hôm nay thời tiết nóng.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['hot weather', 'bad weather', 'weather forecast'],
     array[]::text[],
     array[]::text[],
     array['weathered'],
     'Không đếm được: nice weather.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hot', 'nóng', 'having a high temperature', 'adjective', '/hɑːt/',
     'It is very hot in summer.', 'Trời rất nóng vào mùa hè.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['hot weather', 'hot summer', 'very hot'],
     array['warm'],
     array['cold'],
     array['heat', 'hotter', 'hotly'],
     'Hot còn nghĩa là cay trong ăn uống.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'warm', 'ấm', 'a little hot in a pleasant way', 'adjective', '/wɔːrm/',
     'The weather is warm in spring.', 'Thời tiết ấm áp vào mùa xuân.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['warm weather', 'warm clothes', 'warm up'],
     array['mild'],
     array['cool', 'cold'],
     array['warmth', 'warmly', 'warming'],
     'Warm up là khởi động hoặc làm ấm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cool', 'mát', 'a little cold in a pleasant way', 'adjective', '/kuːl/',
     'It is cool in the evening.', 'Buổi tối trời mát.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['cool weather', 'cool breeze', 'keep cool'],
     array['chilly'],
     array['warm', 'hot'],
     array['coolly', 'coolness', 'cooler'],
     'Cool còn có nghĩa là ngầu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rain', 'mưa', 'water that falls from the sky', 'noun', '/reɪn/',
     'We have heavy rain in July.', 'Chúng tôi có mưa lớn vào tháng Bảy.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['heavy rain', 'light rain', 'rain forest'],
     array['shower'],
     array[]::text[],
     array['rainy', 'rainfall', 'raindrop'],
     'Cũng là động từ: It rains a lot.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'snow', 'tuyết', 'white ice pieces that fall from the sky', 'noun', '/snoʊ/',
     'It rarely snows in my country.', 'Ở nước tôi hiếm khi có tuyết.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening'],
     array['heavy snow', 'snow falls', 'snow and ice'],
     array[]::text[],
     array[]::text[],
     array['snowy', 'snowfall', 'snowman'],
     'Cũng là động từ: It snows in winter.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wind', 'gió', 'air that moves', 'noun', '/wɪnd/',
     'Strong wind blows the leaves away.', 'Gió mạnh thổi bay lá.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening'],
     array['strong wind', 'cold wind', 'wind turbine'],
     array['breeze'],
     array[]::text[],
     array['windy', 'windmill', 'wind turbine'],
     'Wind (gió) /wɪnd/ khác wind (quấn) /waɪnd/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'storm', 'cơn bão', 'very bad weather with wind and rain', 'noun', '/stɔːrm/',
     'A storm hits the city every year.', 'Mỗi năm một cơn bão đổ bộ vào thành phố.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['heavy storm', 'severe storm', 'storm warning'],
     array['gale'],
     array[]::text[],
     array['stormy'],
     'Stormy weather là thời tiết bão tố.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'flood', 'lũ lụt', 'a large amount of water covering dry land', 'noun', '/flʌd/',
     'The flood destroyed many houses.', 'Trận lũ phá huỷ nhiều ngôi nhà.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['heavy flood', 'flood damage', 'flood area'],
     array['deluge'],
     array['drought'],
     array['floods', 'flooded'],
     'Cũng là động từ: The river floods.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'drought', 'hạn hán', 'a long time with little or no rain', 'noun', '/draʊt/',
     'A long drought hurts farmers.', 'Hạn hán kéo dài gây hại cho nông dân.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['severe drought', 'long drought', 'drought and flood'],
     array['water shortage'],
     array['flood'],
     array['dry'],
     'Drought phát âm /draʊt/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sea', 'biển', 'a large area of salt water', 'noun', '/siː/',
     'The sea is getting warmer.', 'Biển đang ấm lên.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['sea level', 'by the sea', 'sea water'],
     array['ocean'],
     array[]::text[],
     array['seaside', 'seafood', 'seaman'],
     'Sea level là mực nước biển.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'level', 'mức, mực', 'the height or amount of something', 'noun', '/ˈlevl/',
     'The sea level is rising.', 'Mực nước biển đang dâng lên.',
     1.0, 'Climate Change', 'A1', 'Writing Task 1 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['sea level', 'high level', 'low level'],
     array['degree', 'amount'],
     array[]::text[],
     array['leveller', 'level'],
     'Level còn là tính từ: bằng phẳng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rise', 'tăng, dâng lên', 'to go up', 'verb', '/raɪz/',
     'Global temperatures rise every year.', 'Nhiệt độ toàn cầu tăng lên mỗi năm.',
     1.0, 'Climate Change', 'A1', 'Writing Task 1 and Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['rise sharply', 'rise steadily', 'a rise in'],
     array['increase', 'go up'],
     array['fall', 'drop'],
     array['rose', 'risen', 'rising'],
     'Rise là nội động từ, không có tân ngữ trực tiếp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fuel', 'nhiên liệu', 'a material burned to give power or heat', 'noun', '/ˈfjuːəl/',
     'Cars use fuel and make smoke.', 'Xe hơi dùng nhiên liệu và thải khói.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['fossil fuel', 'burn fuel', 'fuel price'],
     array[]::text[],
     array[]::text[],
     array['fuelling'],
     'Fossil fuel là nhiên liệu hoá thạch.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'oil', 'dầu', 'a thick liquid used as fuel or in cooking', 'noun', '/ɔɪl/',
     'The country sells oil to other countries.', 'Đất nước này bán dầu cho các nước khác.',
     1.0, 'Climate Change', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['oil price', 'crude oil', 'cooking oil'],
     array['petroleum'],
     array[]::text[],
     array['oily', 'oilfield'],
     'Oil vừa là dầu mỏ vừa là dầu ăn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'coal', 'than đá', 'a black rock burned for heat and power', 'noun', '/koʊl/',
     'Burning coal makes the air dirty.', 'Đốt than làm không khí bẩn.',
     1.0, 'Climate Change', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading'],
     array['burn coal', 'coal mine', 'coal power'],
     array[]::text[],
     array[]::text[],
     array['coalfield'],
     'Coal power là điện than.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'smoke', 'khói', 'grey or black gas made by fire', 'noun', '/smoʊk/',
     'Smoke from factories fills the sky.', 'Khói từ nhà máy tràn ngập bầu trời.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Pollution).',
     array['Speaking', 'Listening', 'Reading'],
     array['thick smoke', 'cigarette smoke', 'smoke from'],
     array['fumes'],
     array[]::text[],
     array['smoky', 'smoker', 'smoking'],
     'Cũng là động từ: to smoke.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'season', 'mùa', 'one of four parts of the year', 'noun', '/ˈsiːzn/',
     'Summer is my favourite season.', 'Mùa hè là mùa yêu thích của tôi.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['rainy season', 'dry season', 'four seasons'],
     array[]::text[],
     array[]::text[],
     array['seasonal', 'seasoning'],
     'Rainy season và dry season rất hay gặp ở Việt Nam.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'summer', 'mùa hè', 'the hottest season of the year', 'noun', '/ˈsʌmər/',
     'We go to the beach in summer.', 'Chúng tôi đi biển vào mùa hè.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening'],
     array['in summer', 'hot summer', 'summer holiday'],
     array[]::text[],
     array[]::text[],
     array['summertime'],
     'Dùng in summer, không dùng in the summer khi nói chung.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'winter', 'mùa đông', 'the coldest season of the year', 'noun', '/ˈwɪntər/',
     'Winter is cold in the north.', 'Mùa đông ở phía bắc rất lạnh.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening'],
     array['in winter', 'cold winter', 'winter clothes'],
     array[]::text[],
     array[]::text[],
     array['wintry'],
     'Winter clothes là quần áo mùa đông.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dry', 'khô', 'without water or rain', 'adjective', '/draɪ/',
     'The weather is dry in the dry season.', 'Thời tiết khô vào mùa khô.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['dry weather', 'dry land', 'dry season'],
     array['arid'],
     array['wet'],
     array['dryness', 'drought', 'drier'],
     'Cũng là động từ: dry clothes.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wet', 'ướt', 'covered with water', 'adjective', '/wet/',
     'The road is wet after the rain.', 'Đường ướt sau cơn mưa.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening'],
     array['get wet', 'wet weather', 'wet season'],
     array['damp'],
     array['dry'],
     array['wetness', 'wetly'],
     'Wet weather là thời tiết ẩm ướt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'carbon', 'các-bon', 'a chemical element found in coal and fuel', 'noun', '/ˈkɑːrbən/',
     'Cars produce carbon and smoke.', 'Xe hơi thải ra khí các-bon và khói.',
     1.0, 'Climate Change', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['carbon dioxide', 'carbon emissions', 'carbon footprint'],
     array[]::text[],
     array[]::text[],
     array['carbonate'],
     'Carbon footprint là lượng khí thải mỗi người tạo ra.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'world', 'thế giới', 'the earth and all the people in it', 'noun', '/wɜːrld/',
     'The world is getting hotter.', 'Thế giới đang nóng lên.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['around the world', 'the whole world', 'world leaders'],
     array['globe'],
     array[]::text[],
     array['worldwide', 'worldly'],
     'Around the world là cụm giới từ hữu dụng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'extreme', 'cực đoan', 'very great or very serious', 'adjective', '/ɪkˈstriːm/',
     'Extreme heat is dangerous.', 'Nắng nóng cực đoan rất nguy hiểm.',
     1.0, 'Climate Change', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['extreme weather', 'extreme heat', 'extreme cold'],
     array['severe'],
     array['mild'],
     array['extremely', 'extremist', 'extremity'],
     'Extreme weather là hiện tượng thời tiết cực đoan.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'forecast', 'dự báo', 'a statement about what will happen', 'noun', '/ˈfɔːrkæst/',
     'The weather forecast says it will rain.', 'Dự báo thời tiết nói trời sẽ mưa.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['weather forecast', 'check the forecast', 'forecast for'],
     array['prediction'],
     array[]::text[],
     array['forecaster'],
     'Cũng là động từ: forecast rain.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'global', 'toàn cầu', 'affecting the whole world', 'adjective', '/ˈɡloʊbl/',
     'Global warming is a serious problem.', 'Sự nóng lên toàn cầu là một vấn đề nghiêm trọng.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['global warming', 'global problem', 'global market'],
     array['worldwide'],
     array['local'],
     array['globe', 'globally', 'globalise'],
     'Global warming là cụm chủ đạo của topic.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'warming', 'sự nóng lên', 'the act of becoming warmer', 'noun', '/ˈwɔːrmɪŋ/',
     'Global warming is changing our weather.', 'Sự nóng lên toàn cầu đang thay đổi thời tiết của chúng ta.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['global warming', 'the effects of warming', 'fight global warming'],
     array['heating'],
     array['cooling'],
     array['warm', 'warmth', 'warmer'],
     'Global warming thường dùng như một cụm cố định.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'disaster', 'thảm hoạ', 'a very bad event that causes damage', 'noun', '/dɪˈzæstər/',
     'A flood is a natural disaster.', 'Lũ lụt là một thảm hoạ thiên nhiên.',
     1.0, 'Climate Change', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['natural disaster', 'disaster area', 'disaster relief'],
     array['catastrophe'],
     array['success'],
     array['disastrous', 'disastrously'],
     'Natural disaster là thiên tai.')
  on conflict do nothing;

end $$;
