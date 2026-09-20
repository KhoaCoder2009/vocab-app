-- BATCH 13 | BAND 1.0 | TOPIC: Environment | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Environment' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Environment',
       'Từ vựng IELTS chủ đề Environment cho Band 1: bảo vệ môi trường, rác thải, tái chế và hành động xanh cơ bản.',
       'easy', true, 'green')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Environment' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'environment', 'môi trường', 'the air, water and land around us', 'noun', '/ɪnˈvaɪrənmənt/',
     'We must protect the environment.', 'Chúng ta phải bảo vệ môi trường.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['protect the environment', 'damage the environment', 'clean environment'],
     array['surroundings'],
     array[]::text[],
     array['environmental', 'environmentalist', 'environmentally'],
     'Phải dùng the environment khi nói về môi trường tự nhiên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'protect', 'bảo vệ', 'to keep something safe from harm', 'verb', '/prəˈtekt/',
     'We should protect our trees and rivers.', 'Chúng ta nên bảo vệ cây cối và sông ngòi.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['protect the environment', 'protect from', 'protect nature'],
     array['defend', 'guard'],
     array['damage', 'harm'],
     array['protection', 'protective', 'protector'],
     'Protect someone/something from + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'save', 'tiết kiệm, cứu', 'to keep something and not waste it', 'verb', '/seɪv/',
     'We can save water at home.', 'Chúng ta có thể tiết kiệm nước ở nhà.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['save water', 'save energy', 'save time'],
     array['conserve', 'preserve'],
     array['waste'],
     array['saving', 'saver', 'savings'],
     'Save water là cụm rất hay dùng trong chủ đề môi trường.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'waste', 'rác thải, lãng phí', 'things you throw away, or using too much', 'noun', '/weɪst/',
     'Plastic waste is a big problem.', 'Rác thải nhựa là một vấn đề lớn.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['plastic waste', 'food waste', 'waste of time'],
     array['rubbish', 'garbage'],
     array['use'],
     array['wasteful', 'wasted', 'wastage'],
     'Cũng là động từ: waste water.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rubbish', 'rác', 'things that you throw away', 'noun', '/ˈrʌbɪʃ/',
     'Please put your rubbish in the bin.', 'Làm ơn bỏ rác vào thùng rác.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (Environment).',
     array['Speaking', 'Listening'],
     array['throw away rubbish', 'rubbish bin', 'collect rubbish'],
     array['garbage', 'trash'],
     array[]::text[],
     array['rubbishy'],
     'Anh-Anh dùng rubbish, Anh-Mỹ dùng garbage hoặc trash.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bin', 'thùng rác', 'a container for rubbish', 'noun', '/bɪn/',
     'The bin is next to the door.', 'Thùng rác ở cạnh cửa.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (Environment).',
     array['Speaking', 'Listening'],
     array['rubbish bin', 'put in the bin', 'recycling bin'],
     array['trash can'],
     array[]::text[],
     array['binman'],
     'Anh-Mỹ nói trash can.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'recycle', 'tái chế', 'to use old materials again to make new things', 'verb', '/ˌriːˈsaɪkl/',
     'We recycle paper and bottles.', 'Chúng tôi tái chế giấy và chai lọ.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['recycle paper', 'recycle plastic', 'recycle waste'],
     array['reuse'],
     array[]::text[],
     array['recycling', 'recyclable', 'recycled'],
     'Recycling là danh từ chỉ việc tái chế.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'plastic', 'nhựa', 'a light material made by people', 'noun', '/ˈplæstɪk/',
     'Plastic bags are bad for the environment.', 'Túi nhựa có hại cho môi trường.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['plastic bag', 'plastic bottle', 'plastic waste'],
     array[]::text[],
     array[]::text[],
     array['plastics'],
     'Cũng là tính từ: plastic cup.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'paper', 'giấy', 'thin material used for writing or wrapping', 'noun', '/ˈpeɪpər/',
     'We recycle paper at school.', 'Chúng tôi tái chế giấy ở trường.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening', 'Writing'],
     array['recycle paper', 'a piece of paper', 'paper bag'],
     array[]::text[],
     array[]::text[],
     array['papers'],
     'Không đếm được: a piece of paper.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bottle', 'cái chai', 'a container for drinks with a narrow neck', 'noun', '/ˈbɑːtl/',
     'I use a water bottle every day.', 'Tôi dùng bình nước mỗi ngày.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (Environment).',
     array['Speaking', 'Listening'],
     array['plastic bottle', 'water bottle', 'recycle bottles'],
     array['flask'],
     array[]::text[],
     array['bottled'],
     'Water bottle là bình nước.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tree', 'cây', 'a tall plant with a thick trunk', 'noun', '/triː/',
     'We plant a tree every year.', 'Chúng tôi trồng một cây mỗi năm.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['plant a tree', 'cut down trees', 'tall tree'],
     array[]::text[],
     array[]::text[],
     array['treetop', 'tree-lined'],
     'Plant a tree là trồng cây.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'park', 'công viên', 'a public place with grass and trees', 'noun', '/pɑːrk/',
     'The park is clean and green.', 'Công viên sạch và xanh.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening'],
     array['city park', 'walk in the park', 'national park'],
     array['garden'],
     array[]::text[],
     array['parking'],
     'Park còn là động từ: park a car.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'green', 'xanh, thân thiện môi trường', 'the colour of grass, or good for nature', 'adjective', '/ɡriːn/',
     'We need more green spaces in the city.', 'Chúng ta cần thêm không gian xanh trong thành phố.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['green space', 'go green', 'green energy'],
     array['eco-friendly'],
     array[]::text[],
     array['greenery', 'greenhouse', 'greenish'],
     'Go green nghĩa là sống thân thiện với môi trường.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'dirty', 'bẩn', 'not clean', 'adjective', '/ˈdɜːrti/',
     'The river is dirty.', 'Con sông bị bẩn.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (Environment).',
     array['Speaking', 'Listening'],
     array['dirty water', 'dirty air', 'get dirty'],
     array['filthy'],
     array['clean'],
     array['dirt', 'dirtily'],
     'Dirty air là không khí ô nhiễm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'litter', 'rác vứt bừa bãi', 'rubbish left in public places', 'noun', '/ˈlɪtər/',
     'Do not drop litter in the park.', 'Đừng xả rác trong công viên.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (Environment).',
     array['Speaking', 'Listening', 'Writing'],
     array['drop litter', 'litter bin', 'pick up litter'],
     array['rubbish'],
     array[]::text[],
     array['litterbug'],
     'Drop litter là hành vi xả rác.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'harm', 'gây hại', 'to hurt or damage someone or something', 'verb', '/hɑːrm/',
     'Plastic bags harm sea animals.', 'Túi nhựa gây hại cho động vật biển.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['harm the environment', 'do harm', 'cause harm'],
     array['damage', 'hurt'],
     array['help', 'benefit'],
     array['harmful', 'harmless', 'harmfully'],
     'Cũng là danh từ: do harm to.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'damage', 'thiệt hại', 'to break or spoil something', 'verb', '/ˈdæmɪdʒ/',
     'Factories can damage rivers.', 'Các nhà máy có thể làm hỏng sông ngòi.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['damage the environment', 'serious damage', 'cause damage'],
     array['harm', 'destroy'],
     array['repair'],
     array['damaged', 'damaging'],
     'Cũng là danh từ không đếm được: cause damage.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'problem', 'vấn đề', 'something difficult that needs a solution', 'noun', '/ˈprɑːbləm/',
     'Pollution is a big problem in my city.', 'Ô nhiễm là một vấn đề lớn ở thành phố tôi.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['big problem', 'serious problem', 'solve a problem'],
     array['issue', 'difficulty'],
     array['solution'],
     array['problematic', 'problems'],
     'Problem with + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'solve', 'giải quyết', 'to find an answer to a problem', 'verb', '/sɑːlv/',
     'We need to solve this problem.', 'Chúng ta cần giải quyết vấn đề này.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['solve a problem', 'solve an issue', 'solve a puzzle'],
     array['fix', 'resolve'],
     array['cause'],
     array['solution', 'solver', 'solvable'],
     'Solve a problem đi cùng nhau rất thường xuyên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'reuse', 'tái sử dụng', 'to use something again', 'verb', '/ˌriːˈjuːz/',
     'I reuse plastic bags.', 'Tôi tái sử dụng túi nhựa.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['reuse bags', 'reuse bottles', 'reduce and reuse'],
     array['reapply'],
     array['throw away'],
     array['reusable', 'reuse'],
     'Reduce, reuse, recycle là khẩu hiệu quen thuộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'reduce', 'giảm', 'to make something smaller or less', 'verb', '/rɪˈduːs/',
     'We can reduce plastic waste.', 'Chúng ta có thể giảm rác thải nhựa.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['reduce pollution', 'reduce waste', 'reduce the risk'],
     array['decrease', 'cut'],
     array['increase'],
     array['reduction', 'reduced', 'reducible'],
     'Reduce + danh từ, không dùng reduce to nếu không có giới từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'natural', 'tự nhiên', 'found in nature, not made by people', 'adjective', '/ˈnætʃrəl/',
     'Natural resources are limited.', 'Tài nguyên thiên nhiên là có hạn.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['natural resources', 'natural environment', 'natural beauty'],
     array['organic'],
     array['artificial'],
     array['nature', 'naturally', 'unnatural'],
     'Natural resources là cụm quan trọng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'resource', 'tài nguyên', 'something useful that a country or person has', 'noun', '/ˈriːsɔːrs/',
     'Water is an important resource.', 'Nước là một nguồn tài nguyên quan trọng.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['natural resources', 'limited resources', 'use resources'],
     array['supply'],
     array[]::text[],
     array['resourceful', 'resources'],
     'Thường dùng ở số nhiều: resources.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'care', 'quan tâm, chăm sóc', 'to feel that something is important', 'verb', '/ker/',
     'I care about the environment.', 'Tôi quan tâm đến môi trường.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['care about', 'take care of', 'care for'],
     array['look after'],
     array['neglect'],
     array['careful', 'careless', 'carefully'],
     'Care about là quan tâm, take care of là chăm sóc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'plant', 'trồng cây', 'to put a tree or flower in the ground', 'verb', '/plænt/',
     'We plant trees near the school.', 'Chúng tôi trồng cây gần trường.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 (Environment).',
     array['Speaking', 'Listening', 'Writing'],
     array['plant a tree', 'plant flowers', 'plant seeds'],
     array['grow'],
     array[]::text[],
     array['planter', 'plantation'],
     'Plant cũng là danh từ: thực vật, nhà máy.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cause', 'gây ra, nguyên nhân', 'to make something happen', 'verb', '/kɔːz/',
     'Cars cause air pollution.', 'Xe hơi gây ra ô nhiễm không khí.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['cause damage', 'cause problems', 'cause pollution'],
     array['lead to', 'produce'],
     array['prevent'],
     array['causal', 'because'],
     'Cũng là danh từ: the cause of pollution.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'avoid', 'tránh', 'to stay away from something', 'verb', '/əˈvɔɪd/',
     'We should avoid using plastic bags.', 'Chúng ta nên tránh dùng túi nhựa.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['avoid using', 'avoid problems', 'avoid waste'],
     array['prevent', 'stay away from'],
     array['choose'],
     array['avoidable', 'unavoidable', 'avoidance'],
     'Avoid + V-ing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'action', 'hành động', 'something that you do', 'noun', '/ˈækʃn/',
     'We need to take action now.', 'Chúng ta cần hành động ngay bây giờ.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['take action', 'immediate action', 'in action'],
     array['step', 'move'],
     array['inaction'],
     array['act', 'active', 'actively'],
     'Take action là cụm hay dùng trong Writing Task 2.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'community', 'cộng đồng', 'a group of people who live in the same area', 'noun', '/kəˈmjuːnəti/',
     'The whole community helps to clean the beach.', 'Cả cộng đồng giúp dọn dẹp bãi biển.',
     1.0, 'Environment', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['local community', 'community project', 'community service'],
     array['neighbourhood'],
     array[]::text[],
     array['communal', 'commune'],
     'Local community là cộng đồng địa phương.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'habit', 'thói quen', 'something you do often', 'noun', '/ˈhæbɪt/',
     'Recycling is a good habit.', 'Tái chế là một thói quen tốt.',
     1.0, 'Environment', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['good habit', 'bad habit', 'break a habit'],
     array['custom', 'routine'],
     array[]::text[],
     array['habitual', 'habitually'],
     'Bad habit và good habit là những cụm nền tảng.')
  on conflict do nothing;

end $$;
