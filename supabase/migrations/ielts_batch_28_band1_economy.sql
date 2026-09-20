-- BATCH 28 | BAND 1.0 | TOPIC: Economy | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A2
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Economy' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Economy',
       'Từ vựng IELTS chủ đề Economy cho Band 1: nền kinh tế, sản xuất, giá cả và thất nghiệp ở mức nhập môn.',
       'easy', true, 'blue')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Economy' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'economy', 'nền kinh tế', 'the system of money and trade in a country', 'noun', '/ɪˈkɑːnəmi/',
     'The economy of my country is growing fast.', 'Nền kinh tế nước tôi đang tăng trưởng nhanh.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['strong economy', 'global economy', 'economy grows'],
     array[]::text[],
     array[]::text[],
     array['economic', 'economical', 'economist'],
     'Economy nhấn âm thứ hai: e-CON-o-my.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'economic', 'thuộc kinh tế', 'connected with money and business', 'adjective', '/ˌiːkəˈnɑːmɪk/',
     'Economic growth helps many families.', 'Tăng trưởng kinh tế giúp nhiều gia đình.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['economic growth', 'economic problem', 'economic development'],
     array['financial'],
     array[]::text[],
     array['economy', 'economics', 'economist'],
     'Economic khác economical (tiết kiệm).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'industry', 'ngành công nghiệp', 'the making of goods in factories', 'noun', '/ˈɪndəstri/',
     'Tourism is an important industry here.', 'Du lịch là một ngành quan trọng ở đây.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['tourism industry', 'food industry', 'heavy industry'],
     array['sector'],
     array[]::text[],
     array['industrial', 'industrialise'],
     'Film industry là ngành điện ảnh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'industrial', 'thuộc công nghiệp', 'connected with factories and industry', 'adjective', '/ɪnˈdʌstriəl/',
     'This is an industrial city.', 'Đây là một thành phố công nghiệp.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['industrial area', 'industrial city', 'industrial waste'],
     array['manufacturing'],
     array[]::text[],
     array['industry', 'industrialised'],
     'Industrial area là khu công nghiệp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'nation', 'quốc gia', 'a country and its people', 'noun', '/ˈneɪʃn/',
     'The whole nation celebrates the holiday.', 'Cả quốc gia ăn mừng ngày lễ.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['the whole nation', 'developing nation', 'nation and people'],
     array['country'],
     array[]::text[],
     array['national', 'nationality'],
     'Nation nhấn cả dân tộc, country nhấn lãnh thổ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'national', 'thuộc quốc gia', 'connected with a whole country', 'adjective', '/ˈnæʃnəl/',
     'The national economy is getting better.', 'Nền kinh tế quốc gia đang tốt hơn.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['national economy', 'national park', 'national holiday'],
     array['countrywide'],
     array['local', 'international'],
     array['nation', 'nationally', 'international'],
     'National park là vườn quốc gia.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'development', 'sự phát triển', 'the process of growing or improving', 'noun', '/dɪˈveləpmənt/',
     'Economic development helps people live better.', 'Phát triển kinh tế giúp mọi người sống tốt hơn.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['economic development', 'rapid development', 'development of'],
     array['growth', 'progress'],
     array[]::text[],
     array['develop', 'developer', 'developed'],
     'Development khác developed: đã phát triển.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'develop', 'phát triển', 'to grow or make something grow', 'verb', '/dɪˈveləp/',
     'The country develops quickly.', 'Đất nước phát triển nhanh chóng.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['develop quickly', 'develop a plan', 'develop skills'],
     array['grow', 'expand'],
     array['decline'],
     array['development', 'developer', 'developing'],
     'Developing country là nước đang phát triển.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'improve', 'cải thiện', 'to become better or make something better', 'verb', '/ɪmˈpruːv/',
     'The government wants to improve the economy.', 'Chính phủ muốn cải thiện nền kinh tế.',
     1.0, 'Economy', 'A2', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['improve quickly', 'improve skills', 'improve the economy'],
     array['enhance', 'better'],
     array['worsen'],
     array['improvement', 'improved'],
     'Improve + danh từ hoặc improve on.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'increase', 'tăng', 'to become bigger in number or amount', 'verb', '/ɪnˈkriːs/',
     'Prices increase every year.', 'Giá cả tăng mỗi năm.',
     1.0, 'Economy', 'A2', 'Writing Task 1 and Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['increase sharply', 'increase by', 'an increase in'],
     array['rise', 'grow'],
     array['decrease'],
     array['increasing', 'increasingly'],
     'Danh từ nhấn âm đầu: an INcrease.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'decrease', 'giảm', 'to become smaller in number or amount', 'verb', '/dɪˈkriːs/',
     'The number of jobs decreases in winter.', 'Số việc làm giảm vào mùa đông.',
     1.0, 'Economy', 'A2', 'Writing Task 1 and Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['decrease sharply', 'decrease by', 'a decrease in'],
     array['fall', 'drop'],
     array['increase'],
     array['decreasing', 'decreased'],
     'Danh từ nhấn âm đầu: a DEcrease.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fall', 'giảm, rơi', 'to go down in level or amount', 'verb', '/fɔːl/',
     'Prices fall in the rainy season.', 'Giá giảm vào mùa mưa.',
     1.0, 'Economy', 'A2', 'Writing Task 1 (Trends).',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['fall sharply', 'fall by', 'a fall in'],
     array['drop', 'decline'],
     array['rise'],
     array['fell', 'fallen', 'falling'],
     'Quá khứ là fell, phân từ là fallen.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'drop', 'giảm mạnh', 'to fall to a lower level', 'verb', '/drɑːp/',
     'The price drops after the holiday.', 'Giá giảm sau kỳ nghỉ lễ.',
     1.0, 'Economy', 'A2', 'Writing Task 1 (Trends).',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['drop sharply', 'drop by', 'a drop in'],
     array['fall', 'decline'],
     array['rise'],
     array['dropped', 'dropping'],
     'Drop mạnh hơn fall.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'produce', 'sản xuất', 'to make something', 'verb', '/prəˈduːs/',
     'The country produces a lot of rice.', 'Đất nước sản xuất nhiều gạo.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['produce goods', 'produce food', 'produce energy'],
     array['make', 'manufacture'],
     array['consume'],
     array['product', 'production', 'producer'],
     'Danh từ produce /ˈprɑːduːs/ là nông sản.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'production', 'sự sản xuất', 'the process of making goods', 'noun', '/prəˈdʌkʃn/',
     'Rice production is high this year.', 'Sản lượng lúa cao năm nay.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['food production', 'increase production', 'mass production'],
     array['manufacturing'],
     array['consumption'],
     array['produce', 'productive', 'product'],
     'Mass production là sản xuất hàng loạt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'demand', 'nhu cầu', 'the need or wish that people have for something', 'noun', '/dɪˈmænd/',
     'The demand for cheap houses is high.', 'Nhu cầu về nhà giá rẻ rất cao.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['high demand', 'meet demand', 'demand for'],
     array['need'],
     array['supply'],
     array['demanding', 'demanded'],
     'Supply and demand là cung và cầu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'supply', 'nguồn cung', 'an amount of something that is available', 'noun', '/səˈplaɪ/',
     'The supply of water is limited.', 'Nguồn cung nước có hạn.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['water supply', 'food supply', 'supply and demand'],
     array['provision'],
     array['demand'],
     array['supplier', 'supplies'],
     'Cũng là động từ: supply goods.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'consumer', 'người tiêu dùng', 'a person who buys goods and services', 'noun', '/kənˈsuːmər/',
     'Consumers want cheaper products.', 'Người tiêu dùng muốn sản phẩm rẻ hơn.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['consumer goods', 'young consumers', 'consumer demand'],
     array['customer', 'buyer'],
     array['producer'],
     array['consume', 'consumption'],
     'Consumer goods là hàng tiêu dùng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'crisis', 'khủng hoảng', 'a time of great trouble or danger', 'noun', '/ˈkraɪsɪs/',
     'The country has an economic crisis.', 'Đất nước có một cuộc khủng hoảng kinh tế.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['economic crisis', 'face a crisis', 'financial crisis'],
     array['emergency'],
     array[]::text[],
     array['crises'],
     'Số nhiều là crises.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'inflation', 'lạm phát', 'a general rise in prices', 'noun', '/ɪnˈfleɪʃn/',
     'High inflation makes life difficult.', 'Lạm phát cao làm cuộc sống khó khăn.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['high inflation', 'rate of inflation', 'control inflation'],
     array['price rise'],
     array['deflation'],
     array['inflate', 'inflated'],
     'Inflation rate là tỷ lệ lạm phát.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'unemployment', 'tình trạng thất nghiệp', 'the state of having no job', 'noun', '/ˌʌnɪmˈplɔɪmənt/',
     'Unemployment is a serious problem for young people.', 'Thất nghiệp là vấn đề nghiêm trọng với người trẻ.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['high unemployment', 'unemployment rate', 'reduce unemployment'],
     array['joblessness'],
     array['employment'],
     array['unemployed', 'employ', 'employment'],
     'Unemployment rate là tỷ lệ thất nghiệp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'poverty', 'sự nghèo đói', 'the state of being very poor', 'noun', '/ˈpɑːvərti/',
     'Poverty is still a problem in some villages.', 'Nghèo đói vẫn là vấn đề ở một số làng.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['live in poverty', 'reduce poverty', 'poverty line'],
     array['hardship'],
     array['wealth'],
     array['poor', 'impoverished'],
     'In poverty là trong cảnh nghèo.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wage', 'tiền lương theo giờ', 'money paid for work, often by the hour', 'noun', '/weɪdʒ/',
     'The minimum wage is going up.', 'Mức lương tối thiểu đang tăng.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['minimum wage', 'low wage', 'wage increase'],
     array['pay', 'salary'],
     array[]::text[],
     array['wages'],
     'Minimum wage là lương tối thiểu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'employment', 'việc làm', 'the state of having a paid job', 'noun', '/ɪmˈplɔɪmənt/',
     'The factory creates employment for local people.', 'Nhà máy tạo việc làm cho người dân địa phương.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['full-time employment', 'find employment', 'employment opportunities'],
     array['work', 'jobs'],
     array['unemployment'],
     array['employ', 'employer', 'employee'],
     'Employment không đếm được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'gap', 'khoảng cách', 'a big difference between two things', 'noun', '/ɡæp/',
     'There is a big gap between rich and poor.', 'Có khoảng cách lớn giữa người giàu và người nghèo.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['wealth gap', 'big gap', 'close the gap'],
     array['difference', 'divide'],
     array[]::text[],
     array['gaps'],
     'Close the gap là thu hẹp khoảng cách.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'boost', 'thúc đẩy', 'to make something increase or improve', 'verb', '/buːst/',
     'Tourism boosts the local economy.', 'Du lịch thúc đẩy nền kinh tế địa phương.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['boost the economy', 'boost sales', 'a big boost'],
     array['increase', 'promote'],
     array['reduce'],
     array['booster', 'boosted'],
     'Cũng là danh từ: a boost to growth.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cut', 'cắt giảm', 'to reduce something', 'verb', '/kʌt/',
     'The company cuts costs to save money.', 'Công ty cắt giảm chi phí để tiết kiệm.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['cut costs', 'cut prices', 'tax cut'],
     array['reduce', 'lower'],
     array['increase'],
     array['cutting', 'cutter'],
     'Quá khứ và phân từ đều là cut.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stable', 'ổn định', 'not likely to change suddenly', 'adjective', '/ˈsteɪbl/',
     'A stable economy attracts investors.', 'Nền kinh tế ổn định thu hút nhà đầu tư.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['stable economy', 'stable price', 'remain stable'],
     array['steady'],
     array['unstable'],
     array['stability', 'stabilise', 'unstable'],
     'Remain stable rất hay dùng trong Task 1.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'GDP', 'tổng sản phẩm quốc nội', 'the total value of goods and services in a country', 'noun', '/ˌdʒiː diː ˈpiː/',
     'The country GDP grows every year.', 'GDP của đất nước tăng mỗi năm.',
     1.0, 'Economy', 'A2', 'Reading and Writing Task 1.',
     array['Speaking', 'Reading', 'Writing'],
     array['GDP growth', 'GDP per person', 'national GDP'],
     array[]::text[],
     array[]::text[],
     array['gross', 'domestic'],
     'Viết tắt của gross domestic product.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'recession', 'suy thoái', 'a period when the economy gets worse', 'noun', '/rɪˈseʃn/',
     'The country is in a recession.', 'Đất nước đang trong thời kỳ suy thoái.',
     1.0, 'Economy', 'A2', 'Speaking Part 3 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['in a recession', 'economic recession', 'global recession'],
     array['downturn'],
     array['boom'],
     array['recessions', 'recede'],
     'Recession thường kéo theo thất nghiệp tăng.')
  on conflict do nothing;

end $$;
