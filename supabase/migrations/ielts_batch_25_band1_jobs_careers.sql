-- BATCH 25 | BAND 1.0 | TOPIC: Jobs & Careers | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Jobs & Careers' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Jobs & Careers',
       'Từ vựng IELTS chủ đề Jobs & Careers cho Band 1: nghề nghiệp, phỏng vấn và kỹ năng cơ bản.',
       'easy', true, 'red')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Jobs & Careers' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'job', 'công việc', 'work that you do regularly to earn money', 'noun', '/dʒɑːb/',
     'I want a good job in the future.', 'Tôi muốn có một công việc tốt trong tương lai.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening', 'Writing'],
     array['get a job', 'find a job', 'dream job'],
     array['work', 'position'],
     array['unemployment'],
     array['jobless', 'jobseeker'],
     'Job là danh từ đếm được, work là không đếm được.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'career', 'sự nghiệp', 'the jobs that a person does in their life', 'noun', '/kəˈrɪr/',
     'She wants a career in medicine.', 'Cô ấy muốn có sự nghiệp trong ngành y.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['start a career', 'career path', 'successful career'],
     array['profession'],
     array[]::text[],
     array['careerist'],
     'Career path là lộ trình nghề nghiệp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'occupation', 'nghề nghiệp', 'a job or profession', 'noun', '/ˌɑːkjuˈpeɪʃn/',
     'Please write your occupation here.', 'Vui lòng viết nghề nghiệp của bạn ở đây.',
     1.0, 'Jobs & Careers', 'A1', 'Listening Section 1 (Form Filling).',
     array['Speaking', 'Listening', 'Reading'],
     array['write your occupation', 'current occupation', 'occupation and age'],
     array['profession', 'job'],
     array[]::text[],
     array['occupy', 'occupational'],
     'Thường xuất hiện trong biểu mẫu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'engineer', 'kỹ sư', 'a person who designs or builds machines or buildings', 'noun', '/ˌendʒɪˈnɪr/',
     'My uncle is a software engineer.', 'Chú tôi là kỹ sư phần mềm.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening', 'Writing'],
     array['software engineer', 'civil engineer', 'become an engineer'],
     array['technician'],
     array[]::text[],
     array['engineering'],
     'Engineering là ngành kỹ thuật.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lawyer', 'luật sư', 'a person who gives legal advice', 'noun', '/ˈlɔːjər/',
     'My aunt is a lawyer in a big firm.', 'Dì tôi là luật sư ở một công ty lớn.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['become a lawyer', 'good lawyer', 'hire a lawyer'],
     array['attorney'],
     array[]::text[],
     array['law', 'legal'],
     'Lawyer nhấn âm đầu: LAW-yer.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pilot', 'phi công', 'a person who flies a plane', 'noun', '/ˈpaɪlət/',
     'My brother wants to be a pilot.', 'Anh trai tôi muốn trở thành phi công.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['become a pilot', 'airline pilot', 'pilot and crew'],
     array['aviator'],
     array[]::text[],
     array['piloting'],
     'Pilot còn là dự án thử nghiệm: a pilot project.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chef', 'đầu bếp', 'a person who cooks in a restaurant', 'noun', '/ʃef/',
     'The chef makes very good soup.', 'Đầu bếp nấu món súp rất ngon.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['famous chef', 'head chef', 'become a chef'],
     array['cook'],
     array[]::text[],
     array['chefs'],
     'Phát âm /ʃef/, chữ ch đọc là /ʃ/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'waiter', 'người phục vụ nam', 'a man who brings food in a restaurant', 'noun', '/ˈweɪtər/',
     'The waiter brings us the menu.', 'Người phục vụ mang thực đơn cho chúng tôi.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['ask the waiter', 'friendly waiter', 'work as a waiter'],
     array['server'],
     array[]::text[],
     array['waitress', 'wait'],
     'Waitress là nữ phục vụ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'artist', 'nghệ sĩ, hoạ sĩ', 'a person who makes art', 'noun', '/ˈɑːrtɪst/',
     'My friend is a talented artist.', 'Bạn tôi là một hoạ sĩ tài năng.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['talented artist', 'street artist', 'famous artist'],
     array['painter'],
     array[]::text[],
     array['art', 'artistic'],
     'Artist chỉ cả hoạ sĩ, nhạc sĩ và người biểu diễn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'actor', 'nam diễn viên', 'a man who acts in films or plays', 'noun', '/ˈæktər/',
     'He is a famous actor.', 'Anh ấy là một diễn viên nổi tiếng.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['famous actor', 'film actor', 'become an actor'],
     array['performer'],
     array[]::text[],
     array['act', 'action', 'actress'],
     'Actress là nữ diễn viên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'writer', 'nhà văn', 'a person who writes books or articles', 'noun', '/ˈraɪtər/',
     'My mother is a writer.', 'Mẹ tôi là một nhà văn.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['famous writer', 'young writer', 'become a writer'],
     array['author'],
     array[]::text[],
     array['write', 'writing'],
     'Writer viết sách, bài báo hay kịch bản.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'journalist', 'nhà báo', 'a person who writes news for newspapers or TV', 'noun', '/ˈdʒɜːrnəlɪst/',
     'A journalist asks the mayor some questions.', 'Một nhà báo hỏi thị trưởng vài câu hỏi.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['young journalist', 'newspaper journalist', 'work as a journalist'],
     array['reporter'],
     array[]::text[],
     array['journalism', 'journal'],
     'Journalism là ngành báo chí.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'designer', 'nhà thiết kế', 'a person who plans how things look', 'noun', '/dɪˈzaɪnər/',
     'My cousin is a fashion designer.', 'Anh họ tôi là một nhà thiết kế thời trang.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['fashion designer', 'graphic designer', 'web designer'],
     array['creator'],
     array[]::text[],
     array['design', 'designing'],
     'Fashion designer là nhà thiết kế thời trang.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'programmer', 'lập trình viên', 'a person who writes computer programs', 'noun', '/ˈproʊɡræmər/',
     'My brother is a computer programmer.', 'Anh trai tôi là một lập trình viên.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening', 'Writing'],
     array['computer programmer', 'become a programmer', 'good programmer'],
     array['coder'],
     array[]::text[],
     array['program', 'programming'],
     'Software developer là cách nói hiện đại khác.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'accountant', 'kế toán', 'a person who keeps financial records', 'noun', '/əˈkaʊntənt/',
     'An accountant works with numbers every day.', 'Kế toán làm việc với con số mỗi ngày.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['become an accountant', 'company accountant', 'work as an accountant'],
     array['bookkeeper'],
     array[]::text[],
     array['account', 'accounting'],
     'Accounting là ngành kế toán.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'architect', 'kiến trúc sư', 'a person who designs buildings', 'noun', '/ˈɑːrkɪtekt/',
     'My father is an architect.', 'Bố tôi là kiến trúc sư.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['famous architect', 'become an architect', 'architect and engineer'],
     array['designer'],
     array[]::text[],
     array['architecture', 'architectural'],
     'Architecture là kiến trúc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'mechanic', 'thợ máy', 'a person who repairs machines and cars', 'noun', '/məˈkænɪk/',
     'The mechanic repairs my motorbike.', 'Người thợ máy sửa xe máy cho tôi.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['car mechanic', 'good mechanic', 'visit a mechanic'],
     array['repairman'],
     array[]::text[],
     array['mechanical', 'mechanics'],
     'Mechanics còn là cơ học.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'electrician', 'thợ điện', 'a person who fixes electrical things', 'noun', '/ɪˌlekˈtrɪʃn/',
     'An electrician comes to fix the lights.', 'Một thợ điện đến sửa đèn.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['call an electrician', 'hire an electrician', 'qualified electrician'],
     array[]::text[],
     array[]::text[],
     array['electrical', 'electricity'],
     'Electrician thuộc gia đình của electric.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'firefighter', 'lính cứu hoả', 'a person whose job is to stop fires', 'noun', '/ˈfaɪərfaɪtər/',
     'Firefighters are brave people.', 'Lính cứu hoả là những người dũng cảm.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['brave firefighter', 'become a firefighter', 'firefighter and police'],
     array['fireman'],
     array[]::text[],
     array['fire', 'fight'],
     'Fireman là từ cũ, firefighter trung tính về giới.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'soldier', 'người lính', 'a person in the army', 'noun', '/ˈsoʊldʒər/',
     'My grandfather was a soldier.', 'Ông tôi từng là một người lính.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Reading'],
     array['brave soldier', 'become a soldier', 'young soldier'],
     array['fighter'],
     array[]::text[],
     array['military'],
     'Soldier phát âm /ˈsoʊldʒər/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'secretary', 'thư ký', 'a person who does office work for a manager', 'noun', '/ˈsekrəteri/',
     'The secretary answers the phone.', 'Thư ký nghe điện thoại.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 (Work).',
     array['Speaking', 'Listening'],
     array['company secretary', 'work as a secretary', 'secretary and manager'],
     array['assistant'],
     array[]::text[],
     array['secretaries'],
     'Secretary còn là bộ trưởng: Secretary of State.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'receptionist', 'lễ tân', 'a person who welcomes visitors at a hotel or office', 'noun', '/rɪˈsepʃənɪst/',
     'The receptionist gives us the room key.', 'Lễ tân đưa chìa khoá phòng cho chúng tôi.',
     1.0, 'Jobs & Careers', 'A1', 'Listening Section 1 (Hotel).',
     array['Speaking', 'Listening'],
     array['hotel receptionist', 'friendly receptionist', 'talk to the receptionist'],
     array['front desk'],
     array[]::text[],
     array['reception', 'receive'],
     'Reception là quầy lễ tân.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'vet', 'bác sĩ thú y', 'a doctor who treats animals', 'noun', '/vet/',
     'I take my dog to the vet.', 'Tôi đưa chó đi khám bác sĩ thú y.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['go to the vet', 'visit the vet', 'animal vet'],
     array[]::text[],
     array[]::text[],
     array['veterinary'],
     'Vet là dạng viết ngắn của veterinarian.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'interview', 'phỏng vấn', 'a meeting to ask someone about a job', 'noun', '/ˈɪntərvjuː/',
     'I have a job interview tomorrow.', 'Ngày mai tôi có buổi phỏng vấn xin việc.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['job interview', 'have an interview', 'pass an interview'],
     array['meeting'],
     array[]::text[],
     array['interviewer', 'interviewee'],
     'Cũng là động từ: interview a candidate.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'apply', 'nộp đơn', 'to ask for a job or place officially', 'verb', '/əˈplaɪ/',
     'I apply for a job at a hotel.', 'Tôi nộp đơn xin việc ở một khách sạn.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['apply for', 'apply for a job', 'apply to a university'],
     array['request'],
     array['withdraw'],
     array['application', 'applicant', 'applicable'],
     'Apply for a job đi kèm giới từ for.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'skill', 'kỹ năng', 'the ability to do something well', 'noun', '/skɪl/',
     'Communication is an important skill at work.', 'Giao tiếp là một kỹ năng quan trọng khi đi làm.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['learn a skill', 'language skills', 'communication skills'],
     array['ability', 'talent'],
     array['inability'],
     array['skilled', 'skilful', 'unskilled'],
     'Skill thường dùng số nhiều: skills.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'experience', 'kinh nghiệm', 'knowledge from doing something for a long time', 'noun', '/ɪkˈspɪriəns/',
     'I have two years of work experience.', 'Tôi có hai năm kinh nghiệm làm việc.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['work experience', 'have experience', 'gain experience'],
     array['practice', 'knowledge'],
     array['inexperience'],
     array['experienced', 'inexperienced'],
     'Work experience là kinh nghiệm làm việc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'retire', 'nghỉ hưu', 'to stop working because of age', 'verb', '/rɪˈtaɪər/',
     'My father retires next year.', 'Bố tôi nghỉ hưu vào năm sau.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['retire from', 'retire early', 'retire at sixty'],
     array['stop working'],
     array['start'],
     array['retirement', 'retired', 'retiree'],
     'Retire from a job là nghỉ hưu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'unemployed', 'thất nghiệp', 'not having a job', 'adjective', '/ˌʌnɪmˈplɔɪd/',
     'Many young people are unemployed.', 'Nhiều người trẻ đang thất nghiệp.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['unemployed people', 'become unemployed', 'the unemployed'],
     array['jobless'],
     array['employed'],
     array['unemployment', 'employ', 'employment'],
     'Unemployment là danh từ: tình trạng thất nghiệp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'qualification', 'bằng cấp, trình độ', 'an exam or course that you have passed', 'noun', '/ˌkwɑːlɪfɪˈkeɪʃn/',
     'You need a qualification for this job.', 'Bạn cần một bằng cấp cho công việc này.',
     1.0, 'Jobs & Careers', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['have qualifications', 'academic qualification', 'get a qualification'],
     array['certificate'],
     array[]::text[],
     array['qualify', 'qualified'],
     'Qualify for là đủ điều kiện.')
  on conflict do nothing;

end $$;
