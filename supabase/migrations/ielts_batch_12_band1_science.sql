-- BATCH 12 | BAND 1.0 | TOPIC: Science | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Science' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Science',
       'Từ vựng IELTS chủ đề Science cho Band 1: môn khoa học, thí nghiệm, chất và hiện tượng cơ bản.',
       'easy', true, 'yellow')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Science' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'science', 'khoa học', 'the study of the natural world', 'noun', '/ˈsaɪəns/',
     'Science is my favourite subject.', 'Khoa học là môn học yêu thích của tôi.',
     1.0, 'Science', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening', 'Writing'],
     array['study science', 'modern science', 'science class'],
     array[]::text[],
     array[]::text[],
     array['scientific', 'scientist', 'scientifically'],
     'Science thường là môn học ở trường.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'scientist', 'nhà khoa học', 'a person who works in science', 'noun', '/ˈsaɪəntɪst/',
     'A scientist works in the laboratory.', 'Một nhà khoa học làm việc trong phòng thí nghiệm.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['famous scientist', 'scientist and engineer', 'become a scientist'],
     array['researcher'],
     array[]::text[],
     array['science', 'scientific'],
     'Cụm become a scientist hay dùng khi nói về nghề nghiệp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'experiment', 'thí nghiệm', 'a test done to learn something', 'noun', '/ɪkˈsperɪmənt/',
     'We do an experiment in science class.', 'Chúng tôi làm một thí nghiệm trong giờ khoa học.',
     1.0, 'Science', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['do an experiment', 'science experiment', 'carry out an experiment'],
     array['test'],
     array[]::text[],
     array['experimental'],
     'Cũng là động từ: experiment with.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'laboratory', 'phòng thí nghiệm', 'a room where scientists do experiments', 'noun', '/ˈlæbrətɔːri/',
     'The laboratory is on the second floor.', 'Phòng thí nghiệm ở tầng hai.',
     1.0, 'Science', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening', 'Reading'],
     array['science laboratory', 'in the laboratory', 'laboratory equipment'],
     array['lab'],
     array[]::text[],
     array['laboratories'],
     'Dạng ngắn thân mật là lab.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chemistry', 'hoá học', 'the study of substances and how they change', 'noun', '/ˈkemɪstri/',
     'I have a chemistry test tomorrow.', 'Ngày mai tôi có bài kiểm tra hoá học.',
     1.0, 'Science', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening'],
     array['chemistry class', 'chemistry teacher', 'study chemistry'],
     array[]::text[],
     array[]::text[],
     array['chemical', 'chemist'],
     'Chemical là hoá chất hoặc thuộc hoá học.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'physics', 'vật lý', 'the study of matter, energy and forces', 'noun', '/ˈfɪzɪks/',
     'Physics can be difficult but interesting.', 'Vật lý có thể khó nhưng thú vị.',
     1.0, 'Science', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening'],
     array['study physics', 'physics lesson', 'physics teacher'],
     array[]::text[],
     array[]::text[],
     array['physical', 'physicist'],
     'Physics là danh từ số ít dù kết thúc bằng s.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'biology', 'sinh học', 'the study of living things', 'noun', '/baɪˈɑːlədʒi/',
     'We learn about plants in biology.', 'Chúng tôi học về thực vật trong môn sinh học.',
     1.0, 'Science', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening'],
     array['biology class', 'study biology', 'biology lab'],
     array[]::text[],
     array[]::text[],
     array['biological', 'biologist'],
     'Bio- nghĩa là sự sống.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'water', 'nước', 'the clear liquid that we drink', 'noun', '/ˈwɔːtər/',
     'Water boils at 100 degrees.', 'Nước sôi ở 100 độ.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['drinking water', 'clean water', 'boiling water'],
     array[]::text[],
     array[]::text[],
     array['watery', 'waterproof'],
     'Không đếm được: a glass of water.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'air', 'không khí', 'the gas around us that we breathe', 'noun', '/er/',
     'We need clean air to live.', 'Chúng ta cần không khí sạch để sống.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['fresh air', 'clean air', 'air pollution'],
     array[]::text[],
     array[]::text[],
     array['airy', 'airport', 'aircraft'],
     'Air pollution là cụm quan trọng cho chủ đề Environment.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'heat', 'nhiệt, sức nóng', 'the quality of being hot', 'noun', '/hiːt/',
     'Heat makes ice melt.', 'Nhiệt làm băng tan chảy.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['heat and light', 'strong heat', 'heat up'],
     array['warmth'],
     array['cold'],
     array['hot', 'heater', 'heating'],
     'Cũng là động từ: heat the water.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'light', 'ánh sáng', 'the brightness from the sun or a lamp', 'noun', '/laɪt/',
     'Plants need light to grow.', 'Cây cần ánh sáng để phát triển.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['sunlight', 'turn on the light', 'bright light'],
     array['brightness'],
     array['dark'],
     array['lighten', 'lighting', 'lightly'],
     'Light còn là tính từ: nhẹ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sun', 'mặt trời', 'the star that gives light and heat to Earth', 'noun', '/sʌn/',
     'The sun gives us light and heat.', 'Mặt trời cho chúng ta ánh sáng và nhiệt.',
     1.0, 'Science', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Reading'],
     array['in the sun', 'the sun rises', 'the sun sets'],
     array[]::text[],
     array[]::text[],
     array['sunny', 'sunlight', 'sunshine'],
     'Dùng the sun vì chỉ có một mặt trời.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'earth', 'Trái Đất', 'the planet where we live', 'noun', '/ɜːrθ/',
     'The Earth goes around the sun.', 'Trái Đất quay quanh mặt trời.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['planet Earth', 'life on Earth', 'the Earth'],
     array['the globe'],
     array[]::text[],
     array['earthly', 'earthquake'],
     'Earth viết hoa khi chỉ hành tinh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'magnet', 'nam châm', 'a piece of metal that pulls iron toward it', 'noun', '/ˈmæɡnət/',
     'A magnet can pick up small nails.', 'Nam châm có thể hút những chiếc đinh nhỏ.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading'],
     array['use a magnet', 'strong magnet', 'magnet attracts iron'],
     array[]::text[],
     array[]::text[],
     array['magnetic', 'magnetism'],
     'Magnet còn dùng nghĩa bóng: a tourist magnet.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'gas', 'khí', 'a substance like air that is not a solid or liquid', 'noun', '/ɡæs/',
     'Oxygen is a gas.', 'Ôxy là một chất khí.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['natural gas', 'gas and liquid', 'gas tank'],
     array[]::text[],
     array[]::text[],
     array['gaseous'],
     'Anh-Mỹ gas còn là xăng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'metal', 'kim loại', 'a hard shiny material like iron or gold', 'noun', '/ˈmetl/',
     'Metal gets hot very fast.', 'Kim loại nóng lên rất nhanh.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading'],
     array['made of metal', 'metal box', 'heavy metal'],
     array[]::text[],
     array[]::text[],
     array['metallic', 'metalwork'],
     'Made of metal nghĩa là làm bằng kim loại.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ice', 'băng, đá', 'frozen water', 'noun', '/aɪs/',
     'Ice melts when it gets warm.', 'Băng tan khi trời ấm lên.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['ice cream', 'melt ice', 'ice cold'],
     array[]::text[],
     array[]::text[],
     array['icy', 'iced'],
     'Ice cream là kem.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'measure', 'đo', 'to find the size or amount of something', 'verb', '/ˈmeʒər/',
     'We measure the water with a cup.', 'Chúng tôi đo lượng nước bằng cái cốc.',
     1.0, 'Science', 'A1', 'Reading and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['measure the length', 'measure the temperature', 'measure carefully'],
     array['calculate'],
     array[]::text[],
     array['measurement', 'measurable'],
     'Cũng là danh từ: take measures.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'weight', 'cân nặng', 'how heavy something is', 'noun', '/weɪt/',
     'The weight of the box is two kilos.', 'Cân nặng của chiếc hộp là hai ký.',
     1.0, 'Science', 'A1', 'Reading and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['lose weight', 'gain weight', 'body weight'],
     array['mass'],
     array['lightness'],
     array['weigh', 'weighty'],
     'Lose weight là giảm cân.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'size', 'kích cỡ', 'how big or small something is', 'noun', '/saɪz/',
     'What size is your phone screen?', 'Màn hình điện thoại của bạn cỡ nào?',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['the size of', 'large size', 'small size'],
     array['dimension'],
     array[]::text[],
     array['sizeable', 'sized'],
     'What size...? là câu hỏi thông dụng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'discover', 'khám phá', 'to find something for the first time', 'verb', '/dɪˈskʌvər/',
     'Scientists discover new things every year.', 'Các nhà khoa học khám phá những điều mới mỗi năm.',
     1.0, 'Science', 'A1', 'Reading and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['discover a new planet', 'discover the truth', 'discover something new'],
     array['find', 'uncover'],
     array['lose'],
     array['discovery', 'discoverer'],
     'Discover là tìm ra cái đã có sẵn, invent là tạo ra cái mới.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fact', 'sự thật', 'something that is true', 'noun', '/fækt/',
     'It is a fact that water boils at 100 degrees.', 'Sự thật là nước sôi ở 100 độ.',
     1.0, 'Science', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['in fact', 'interesting fact', 'a scientific fact'],
     array['truth'],
     array['opinion', 'fiction'],
     array['factual', 'actually'],
     'In fact dùng để nhấn mạnh hoặc bổ sung thông tin.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'boil', 'đun sôi', 'to heat a liquid until it bubbles', 'verb', '/bɔɪl/',
     'Boil the water for five minutes.', 'Đun sôi nước trong năm phút.',
     1.0, 'Science', 'A1', 'Reading (Process).',
     array['Speaking', 'Listening', 'Reading'],
     array['boil water', 'boil an egg', 'boiling point'],
     array['heat'],
     array['freeze'],
     array['boiler', 'boiling', 'boiled'],
     'Boiled egg là trứng luộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'melt', 'tan chảy', 'to change from solid to liquid because of heat', 'verb', '/melt/',
     'Ice melts in the sun.', 'Băng tan trong ánh nắng.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading'],
     array['melt ice', 'melt away', 'melting point'],
     array['thaw'],
     array['freeze'],
     array['molten', 'melted'],
     'Melt và freeze là hai từ trái nghĩa hay gặp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'burn', 'cháy, đốt', 'to be on fire or to damage by heat', 'verb', '/bɜːrn/',
     'Wood burns easily.', 'Gỗ dễ cháy.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading'],
     array['burn wood', 'burn fuel', 'burn a hand'],
     array['ignite'],
     array[]::text[],
     array['burner', 'burnt', 'burning'],
     'Burn còn có nghĩa là đốt (calo).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'mix', 'trộn', 'to put two or more things together', 'verb', '/mɪks/',
     'Mix the water and sugar together.', 'Trộn nước và đường với nhau.',
     1.0, 'Science', 'A1', 'Reading (Process).',
     array['Speaking', 'Listening', 'Reading'],
     array['mix together', 'mix with', 'mix well'],
     array['blend'],
     array['separate'],
     array['mixture', 'mixed'],
     'Mixture là danh từ chỉ hỗn hợp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'liquid', 'chất lỏng', 'a substance like water that can flow', 'noun', '/ˈlɪkwɪd/',
     'Water is a liquid.', 'Nước là một chất lỏng.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading'],
     array['liquid soap', 'pour a liquid', 'liquid and solid'],
     array['fluid'],
     array['solid'],
     array['liquefy', 'liquidity'],
     'Liquid còn là tính từ: liquid food.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'solid', 'chất rắn', 'a hard substance that keeps its shape', 'noun', '/ˈsɑːlɪd/',
     'Ice is a solid.', 'Băng là một chất rắn.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading'],
     array['solid and liquid', 'solid ground', 'solid food'],
     array['firm'],
     array['liquid'],
     array['solidify', 'solidly'],
     'Solid còn là tính từ: solid wall, solid evidence.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'microscope', 'kính hiển vi', 'a tool that makes very small things look bigger', 'noun', '/ˈmaɪkrəskoʊp/',
     'We look at cells under a microscope.', 'Chúng tôi quan sát tế bào dưới kính hiển vi.',
     1.0, 'Science', 'A1', 'Reading (Science).',
     array['Speaking', 'Listening', 'Reading'],
     array['under a microscope', 'use a microscope', 'electron microscope'],
     array[]::text[],
     array[]::text[],
     array['microscopic', 'microscopically'],
     'Under a microscope là cụm giới từ quen thuộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'electricity', 'điện', 'power that makes lights and machines work', 'noun', '/ɪˌlekˈtrɪsəti/',
     'Electricity comes from power stations.', 'Điện đến từ các nhà máy điện.',
     1.0, 'Science', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['use electricity', 'save electricity', 'electricity bill'],
     array['power'],
     array[]::text[],
     array['electric', 'electrical', 'electrician'],
     'Electricity bill là hoá đơn tiền điện.')
  on conflict do nothing;

end $$;
