export type GrammarQuestionType = 'affirmative' | 'negative' | 'question' | 'wh-question'

export interface GrammarQuizBankItem {
  id: string
  lesson_id: string
  type: GrammarQuestionType
  prompt: string
  options: string[]
  correct_answer: string
  explanation: string
  sort_order: number
}

type QuizTuple = [prompt: string, options: string[], correct: string, explanation: string]

function pack(lessonId: string, type: GrammarQuestionType, items: QuizTuple[]): GrammarQuizBankItem[] {
  return items.map(([prompt, options, correct_answer, explanation], index) => ({
    id: `${lessonId}-${type}-${index + 1}`,
    lesson_id: lessonId,
    type,
    prompt,
    options,
    correct_answer,
    explanation,
    sort_order: index,
  }))
}

function lessonQuizzes(
  lessonId: string,
  groups: Record<GrammarQuestionType, QuizTuple[]>
): GrammarQuizBankItem[] {
  return (Object.keys(groups) as GrammarQuestionType[]).flatMap((type) => pack(lessonId, type, groups[type]))
}

export const grammarQuizBank: GrammarQuizBankItem[] = [
  ...lessonQuizzes('present-simple', {
    affirmative: [
      ['She ___ to school every day.', ['go', 'goes', 'going', 'gone'], 'goes', 'He/She/It thêm -s/-es ở Present Simple.'],
      ['Water ___ at 100°C.', ['boil', 'boils', 'boiling', 'boiled'], 'boils', 'Sự thật luôn đúng dùng Present Simple, chủ ngữ số ít nên boils.'],
      ['They ___ English every evening.', ['study', 'studies', 'studying', 'studied'], 'study', 'They không thêm -s; dùng động từ nguyên mẫu.'],
    ],
    negative: [
      ['He ___ like coffee.', ["don't", "doesn't", "isn't", "hasn't"], "doesn't", 'Ngôi thứ ba số ít dùng does not / doesn’t + V nguyên mẫu.'],
      ['I ___ go out on Mondays.', ["don't", "doesn't", "am not", 'not'], "don't", 'I/You/We/They dùng do not / don’t.'],
      ['She ___ play football.', ["don't", "doesn't", "isn't", 'not'], "doesn't", 'She dùng doesn’t + play, không chia động từ chính.'],
    ],
    question: [
      ['___ she live here?', ['Do', 'Does', 'Is', 'Has'], 'Does', 'Câu hỏi Yes/No với he/she/it dùng Does + S + V?'],
      ['___ they work on Sundays?', ['Do', 'Does', 'Are', 'Have'], 'Do', 'They dùng Do + S + V?'],
      ['___ he go to school by bike?', ['Do', 'Does', 'Is', 'Did'], 'Does', 'He dùng Does; động từ giữ nguyên go.'],
    ],
    'wh-question': [
      ['Where ___ she live?', ['do', 'does', 'is', 'has'], 'does', 'Wh-question: Wh-word + does + S + V?'],
      ['What ___ they do every day?', ['do', 'does', 'are', 'did'], 'do', 'They dùng do sau từ để hỏi.'],
      ['How often ___ he study English?', ['do', 'does', 'is', 'has'], 'does', 'How often hỏi tần suất; he cần does.'],
    ],
  }),
  ...lessonQuizzes('present-continuous', {
    affirmative: [
      ['I ___ English now.', ['study', 'am studying', 'studied', 'have studied'], 'am studying', 'Hiện tại tiếp diễn: am/is/are + V-ing.'],
      ['She ___ dinner at the moment.', ['cooks', 'is cooking', 'cooked', 'has cooked'], 'is cooking', 'At the moment báo hiệu hành động đang xảy ra.'],
      ['They ___ football today.', ['play', 'are playing', 'played', 'have played'], 'are playing', 'They + are + V-ing.'],
    ],
    negative: [
      ['He ___ working right now.', ["isn't", "doesn't", "hasn't", "didn't"], "isn't", 'Phủ định: am/is/are + not + V-ing.'],
      ['We ___ watching TV now.', ["aren't", "don't", "haven't", "didn't"], "aren't", 'We dùng are not / aren’t.'],
      ['I ___ sleeping at the moment.', ["am not", "don't", "isn't", "haven't"], 'am not', 'I dùng am not + V-ing.'],
    ],
    question: [
      ['___ she studying now?', ['Does', 'Is', 'Has', 'Did'], 'Is', 'Câu hỏi: Is/Are/Am + S + V-ing?'],
      ['___ they playing football?', ['Do', 'Are', 'Have', 'Did'], 'Are', 'They dùng Are + S + V-ing?'],
      ['___ you using your phone?', ['Do', 'Are', 'Have', 'Is'], 'Are', 'You dùng Are.'],
    ],
    'wh-question': [
      ['What ___ she doing now?', ['does', 'is', 'has', 'did'], 'is', 'Wh-word + is/are/am + S + V-ing?'],
      ['Where ___ they going?', ['do', 'are', 'have', 'did'], 'are', 'They đi với are.'],
      ['Why ___ he studying so late?', ['does', 'is', 'has', 'did'], 'is', 'Why + is + he + V-ing?'],
    ],
  }),
  ...lessonQuizzes('present-perfect', {
    affirmative: [
      ['I ___ my homework.', ['finished', 'have finished', 'am finishing', 'finish'], 'have finished', 'Kết quả còn liên quan hiện tại: have/has + V3.'],
      ['She ___ here since 2020.', ['lived', 'has lived', 'is living', 'lives'], 'has lived', 'Since + mốc thời gian dùng Present Perfect.'],
      ['They ___ this film already.', ['saw', 'have seen', 'are seeing', 'see'], 'have seen', 'Already thường đi với Present Perfect.'],
    ],
    negative: [
      ['He ___ finished yet.', ["hasn't", "didn't", "isn't", "doesn't"], "hasn't", 'Yet thường đi với phủ định Present Perfect.'],
      ['I ___ been to Japan.', ["haven't", "didn't", "am not", "don't"], "haven't", 'Kinh nghiệm phủ định: have not + V3.'],
      ['We ___ eaten lunch yet.', ["haven't", "didn't", "aren't", "don't"], "haven't", 'We dùng have not.'],
    ],
    question: [
      ['___ you ever been to London?', ['Did', 'Have', 'Are', 'Do'], 'Have', 'Have/Has + S + ever + V3?'],
      ['___ she finished her homework?', ['Did', 'Has', 'Is', 'Does'], 'Has', 'She dùng Has.'],
      ['___ they arrived yet?', ['Did', 'Have', 'Are', 'Do'], 'Have', 'Yet trong câu hỏi Present Perfect dùng Have.'],
    ],
    'wh-question': [
      ['How long ___ she lived here?', ['did', 'has', 'is', 'does'], 'has', 'How long + have/has + S + V3?'],
      ['What ___ you done today?', ['did', 'have', 'are', 'do'], 'have', 'You dùng have.'],
      ['Where ___ he gone?', ['did', 'has', 'is', 'does'], 'has', 'He dùng has + V3.'],
    ],
  }),
  ...lessonQuizzes('present-perfect-continuous', {
    affirmative: [
      ['I ___ for two hours.', ['have studied', 'have been studying', 'am studying', 'studied'], 'have been studying', 'Nhấn thời lượng: have/has been + V-ing.'],
      ['She ___ all day.', ['worked', 'has been working', 'is working', 'works'], 'has been working', 'All day nhấn quá trình kéo dài đến hiện tại.'],
      ['They ___ English since 2021.', ['study', 'have been studying', 'are studying', 'studied'], 'have been studying', 'Since + mốc thời gian, nhấn quá trình liên tục.'],
    ],
    negative: [
      ['He ___ sleeping well lately.', ["hasn't been", "didn't", "isn't", "doesn't"], "hasn't been", 'Phủ định: has not been + V-ing.'],
      ['We ___ waiting long.', ["haven't been", "didn't", "aren't", "don't"], "haven't been", 'We dùng have not been.'],
      ['I ___ feeling well recently.', ["haven't been", "didn't", "am not", "don't"], "haven't been", 'Recently thường đi với dạng hoàn thành tiếp diễn.'],
    ],
    question: [
      ['___ you been studying long?', ['Did', 'Have', 'Are', 'Do'], 'Have', 'Have/Has + S + been + V-ing?'],
      ['___ she been working all day?', ['Did', 'Has', 'Is', 'Does'], 'Has', 'She dùng Has been.'],
      ['___ they been waiting here?', ['Did', 'Have', 'Are', 'Do'], 'Have', 'They dùng Have been.'],
    ],
    'wh-question': [
      ['How long ___ you been studying English?', ['did', 'have', 'are', 'do'], 'have', 'How long rất hay đi với Present Perfect Continuous.'],
      ['What ___ she been doing all morning?', ['did', 'has', 'is', 'does'], 'has', 'Wh-word + has + S + been + V-ing?'],
      ['Why ___ they been waiting so long?', ['did', 'have', 'are', 'do'], 'have', 'They dùng have been.'],
    ],
  }),
  ...lessonQuizzes('past-simple', {
    affirmative: [
      ['I ___ to school yesterday.', ['go', 'went', 'gone', 'going'], 'went', 'Yesterday là dấu hiệu Past Simple; go → went.'],
      ['We ___ a film last night.', ['watch', 'watched', 'watching', 'have watched'], 'watched', 'Last night dùng Past Simple.'],
      ['She ___ home an hour ago.', ['comes', 'came', 'has come', 'is coming'], 'came', 'Ago đi với Past Simple.'],
    ],
    negative: [
      ['I ___ go out yesterday.', ["didn't", "don't", "wasn't", "haven't"], "didn't", 'Phủ định Past Simple: did not + V nguyên mẫu.'],
      ['She ___ like the movie.', ["didn't", "doesn't", "wasn't", "hasn't"], "didn't", 'Không chia động từ chính sau didn’t.'],
      ['They ___ finish the test.', ["didn't", "don't", "weren't", "haven't"], "didn't", 'Did not + finish, không dùng finished.'],
    ],
    question: [
      ['___ you go to school yesterday?', ['Do', 'Did', 'Have', 'Were'], 'Did', 'Câu hỏi: Did + S + V nguyên mẫu?'],
      ['___ she watch the film?', ['Does', 'Did', 'Has', 'Was'], 'Did', 'Mọi ngôi đều dùng Did ở Past Simple.'],
      ['___ they play football last week?', ['Do', 'Did', 'Have', 'Were'], 'Did', 'Last week → Did.'],
    ],
    'wh-question': [
      ['Where ___ you go yesterday?', ['do', 'did', 'have', 'were'], 'did', 'Wh-word + did + S + V?'],
      ['What ___ she buy last night?', ['does', 'did', 'has', 'was'], 'did', 'Last night → did.'],
      ['When ___ they arrive?', ['do', 'did', 'have', 'are'], 'did', 'When hỏi thời điểm quá khứ dùng did.'],
    ],
  }),
  ...lessonQuizzes('past-continuous', {
    affirmative: [
      ['I ___ when you called.', ['studied', 'was studying', 'have studied', 'study'], 'was studying', 'Hành động đang diễn ra bị xen vào: was/were + V-ing.'],
      ['They ___ football at 5 p.m.', ['played', 'were playing', 'have played', 'play'], 'were playing', 'At 5 p.m. là một thời điểm trong quá khứ.'],
      ['She ___ dinner at that time.', ['cooked', 'was cooking', 'has cooked', 'cooks'], 'was cooking', 'At that time dùng Past Continuous.'],
    ],
    negative: [
      ['He ___ sleeping when I arrived.', ["wasn't", "didn't", "hasn't", "isn't"], "wasn't", 'Phủ định: was/were + not + V-ing.'],
      ['We ___ watching TV then.', ["weren't", "didn't", "haven't", "aren't"], "weren't", 'We dùng were not.'],
      ['I ___ working at 8 p.m.', ["wasn't", "didn't", "haven't", "am not"], "wasn't", 'I dùng was not.'],
    ],
    question: [
      ['___ she studying when you called?', ['Did', 'Was', 'Has', 'Does'], 'Was', 'Was/Were + S + V-ing?'],
      ['___ they playing football?', ['Did', 'Were', 'Have', 'Do'], 'Were', 'They dùng Were.'],
      ['___ you using your phone?', ['Did', 'Were', 'Have', 'Are'], 'Were', 'You dùng Were ở quá khứ tiếp diễn.'],
    ],
    'wh-question': [
      ['What ___ you doing at 8 p.m.?', ['did', 'were', 'have', 'are'], 'were', 'What + were + you + V-ing?'],
      ['Where ___ she going when you saw her?', ['did', 'was', 'has', 'is'], 'was', 'She dùng was.'],
      ['Why ___ they laughing?', ['did', 'were', 'have', 'are'], 'were', 'They dùng were.'],
    ],
  }),
  ...lessonQuizzes('past-perfect', {
    affirmative: [
      ['The train ___ when we arrived.', ['left', 'had left', 'was leaving', 'has left'], 'had left', 'Việc xảy ra trước một mốc quá khứ: had + V3.'],
      ['I ___ my homework before dinner.', ['finished', 'had finished', 'was finishing', 'have finished'], 'had finished', 'Before dinner làm rõ thứ tự: xong trước.'],
      ['She ___ the news before I told her.', ['knew', 'had known', 'was knowing', 'has known'], 'had known', 'Had + V3 cho hành động trước.'],
    ],
    negative: [
      ['He ___ seen the film before.', ["hadn't", "didn't", "hasn't", "wasn't"], "hadn't", 'Phủ định: had not + V3.'],
      ['We ___ arrived when the show started.', ["hadn't", "didn't", "haven't", "weren't"], "hadn't", 'Chưa đến trước khi show bắt đầu.'],
      ['I ___ finished when she called.', ["hadn't", "didn't", "haven't", "wasn't"], "hadn't", 'Had not finished.'],
    ],
    question: [
      ['___ the train left when you arrived?', ['Did', 'Had', 'Has', 'Was'], 'Had', 'Had + S + V3?'],
      ['___ she finished before dinner?', ['Did', 'Had', 'Has', 'Was'], 'Had', 'Câu hỏi Past Perfect dùng Had.'],
      ['___ they eaten before you came?', ['Did', 'Had', 'Have', 'Were'], 'Had', 'They vẫn dùng Had.'],
    ],
    'wh-question': [
      ['What ___ she done before you arrived?', ['did', 'had', 'has', 'was'], 'had', 'Wh-word + had + S + V3?'],
      ['Why ___ the train left already?', ['did', 'had', 'has', 'was'], 'had', 'Already ở quá khứ trước một mốc khác.'],
      ['Where ___ they gone before the rain started?', ['did', 'had', 'have', 'were'], 'had', 'Gone là V3 sau had.'],
    ],
  }),
  ...lessonQuizzes('past-perfect-continuous', {
    affirmative: [
      ['She ___ for hours before the exam.', ['studied', 'had been studying', 'was studying', 'has been studying'], 'had been studying', 'Had been + V-ing nhấn thời lượng trước một mốc quá khứ.'],
      ['He was tired because he ___ .', ['ran', 'had been running', 'was running', 'has been running'], 'had been running', 'Giải thích nguyên nhân trạng thái quá khứ.'],
      ['They ___ all morning before lunch.', ['worked', 'had been working', 'were working', 'have been working'], 'had been working', 'All morning trước lunch → had been working.'],
    ],
    negative: [
      ['He ___ feeling well before the trip.', ["hadn't been", "didn't", "wasn't", "hasn't been"], "hadn't been", 'Phủ định: had not been + V-ing.'],
      ['We ___ waiting long when the bus came.', ["hadn't been", "didn't", "weren't", "haven't been"], "hadn't been", 'Chưa chờ lâu thì bus tới.'],
      ['I ___ sleeping well for weeks.', ["hadn't been", "didn't", "wasn't", "haven't been"], "hadn't been", 'For weeks trước một mốc quá khứ.'],
    ],
    question: [
      ['___ she been studying long before the test?', ['Did', 'Had', 'Has', 'Was'], 'Had', 'Had + S + been + V-ing?'],
      ['___ they been working all day?', ['Did', 'Had', 'Have', 'Were'], 'Had', 'Past Perfect Continuous hỏi bằng Had.'],
      ['___ you been waiting when I called?', ['Did', 'Had', 'Have', 'Were'], 'Had', 'You vẫn dùng Had been.'],
    ],
    'wh-question': [
      ['How long ___ she been studying before the exam?', ['did', 'had', 'has', 'was'], 'had', 'How long + had + S + been + V-ing?'],
      ['What ___ he been doing all morning?', ['did', 'had', 'has', 'was'], 'had', 'Wh-word + had + been + V-ing?'],
      ['Why ___ they been waiting outside?', ['did', 'had', 'have', 'were'], 'had', 'They dùng had been.'],
    ],
  }),
  ...lessonQuizzes('future-simple', {
    affirmative: [
      ['I ___ you tonight.', ['call', 'will call', 'am calling', 'called'], 'will call', 'Will + V nguyên mẫu cho lời hứa hoặc quyết định.'],
      ['I think it ___ tomorrow.', ['rains', 'will rain', 'is raining', 'rained'], 'will rain', 'I think thường đi với will.'],
      ['She ___ help us later.', ['helps', 'will help', 'is helping', 'helped'], 'will help', 'Later → will + V.'],
    ],
    negative: [
      ['I ___ be late.', ["won't", "don't", "am not", "didn't"], "won't", 'Phủ định: will not / won’t + V.'],
      ['He ___ come tomorrow.', ["won't", "doesn't", "isn't", "didn't"], "won't", 'Tomorrow có thể đi với will not.'],
      ['They ___ forget your birthday.', ["won't", "don't", "aren't", "didn't"], "won't", 'Lời hứa phủ định dùng won’t.'],
    ],
    question: [
      ['___ you help me?', ['Do', 'Will', 'Are', 'Did'], 'Will', 'Will + S + V?'],
      ['___ it rain tomorrow?', ['Does', 'Will', 'Is', 'Did'], 'Will', 'Dự đoán tương lai dùng Will.'],
      ['___ she call us later?', ['Does', 'Will', 'Is', 'Did'], 'Will', 'Later → Will.'],
    ],
    'wh-question': [
      ['When ___ you call me?', ['do', 'will', 'are', 'did'], 'will', 'Wh-word + will + S + V?'],
      ['What ___ she do next?', ['does', 'will', 'is', 'did'], 'will', 'Next báo hiệu tương lai đơn.'],
      ['Where ___ they go tomorrow?', ['do', 'will', 'are', 'did'], 'will', 'Tomorrow → will.'],
    ],
  }),
  ...lessonQuizzes('future-continuous', {
    affirmative: [
      ['This time tomorrow, I ___ to London.', ['will fly', 'will be flying', 'am flying', 'fly'], 'will be flying', 'Will be + V-ing cho việc đang diễn ra tại một thời điểm tương lai.'],
      ['At 8 p.m. tomorrow, she ___ .', ['will study', 'will be studying', 'studies', 'is studying'], 'will be studying', 'At 8 p.m. tomorrow là mốc tương lai cụ thể.'],
      ['They ___ football this time next week.', ['will play', 'will be playing', 'play', 'are playing'], 'will be playing', 'This time next week → Future Continuous.'],
    ],
    negative: [
      ['I ___ using the laptop tonight.', ["won't be", "won't", "am not", "don't"], "won't be", 'Phủ định: will not be + V-ing.'],
      ['He ___ working at that time.', ["won't be", "won't", "isn't", "doesn't"], "won't be", 'At that time trong tương lai dùng won’t be.'],
      ['We ___ staying at home tomorrow evening.', ["won't be", "won't", "aren't", "don't"], "won't be", 'We dùng will not be.'],
    ],
    question: [
      ['___ you be using your laptop tonight?', ['Do', 'Will', 'Are', 'Did'], 'Will', 'Will + S + be + V-ing?'],
      ['___ she be studying at 8 p.m.?', ['Does', 'Will', 'Is', 'Did'], 'Will', 'Câu hỏi Future Continuous bắt đầu bằng Will.'],
      ['___ they be travelling this time tomorrow?', ['Do', 'Will', 'Are', 'Did'], 'Will', 'This time tomorrow → Will be.'],
    ],
    'wh-question': [
      ['What ___ you be doing this time tomorrow?', ['do', 'will', 'are', 'did'], 'will', 'What will + S + be + V-ing?'],
      ['Where ___ she be staying next week?', ['does', 'will', 'is', 'did'], 'will', 'Next week + quá trình → will be.'],
      ['Who ___ they be meeting at 7 p.m.?', ['do', 'will', 'are', 'did'], 'will', 'Who will + S + be + V-ing?'],
    ],
  }),
  ...lessonQuizzes('future-perfect', {
    affirmative: [
      ['By Friday, I ___ the project.', ['will finish', 'will have finished', 'will be finishing', 'finish'], 'will have finished', 'By + mốc tương lai: will have + V3.'],
      ['She ___ by 2028.', ['will graduate', 'will have graduated', 'graduates', 'is graduating'], 'will have graduated', 'Hoàn thành trước một năm trong tương lai.'],
      ['They ___ the report before noon.', ['will write', 'will have written', 'write', 'are writing'], 'will have written', 'Before noon là hạn hoàn thành.'],
    ],
    negative: [
      ['I ___ finished by then.', ["won't have", "won't", "don't", "am not"], "won't have", 'Phủ định: will not have + V3.'],
      ['He ___ arrived by 6 p.m.', ["won't have", "won't", "doesn't", "isn't"], "won't have", 'By 6 p.m. → won’t have arrived.'],
      ['We ___ completed it before Friday.', ["won't have", "won't", "don't", "aren't"], "won't have", 'We dùng will not have.'],
    ],
    question: [
      ['___ you have finished by Friday?', ['Do', 'Will', 'Have', 'Are'], 'Will', 'Will + S + have + V3?'],
      ['___ she have graduated by 2028?', ['Does', 'Will', 'Has', 'Is'], 'Will', 'By 2028 → Future Perfect.'],
      ['___ they have arrived by then?', ['Do', 'Will', 'Have', 'Are'], 'Will', 'By then thường đi với Future Perfect.'],
    ],
    'wh-question': [
      ['When ___ you have finished the report?', ['do', 'will', 'have', 'are'], 'will', 'When will + S + have + V3?'],
      ['What ___ she have done by tomorrow?', ['does', 'will', 'has', 'is'], 'will', 'By tomorrow → will have.'],
      ['How many pages ___ they have written by noon?', ['do', 'will', 'have', 'are'], 'will', 'How many + will + have + V3?'],
    ],
  }),
  ...lessonQuizzes('future-perfect-continuous', {
    affirmative: [
      ['By next year, I ___ English for five years.', ['will study', 'will have been studying', 'will be studying', 'have studied'], 'will have been studying', 'Will have been + V-ing nhấn thời lượng đến mốc tương lai.'],
      ['By June, she ___ here for a decade.', ['will work', 'will have been working', 'will be working', 'has worked'], 'will have been working', 'For a decade + by June.'],
      ['They ___ for hours by the time we arrive.', ['will wait', 'will have been waiting', 'will be waiting', 'have waited'], 'will have been waiting', 'By the time nhấn quá trình kéo dài đến lúc đó.'],
    ],
    negative: [
      ['I ___ studying that long by then.', ["won't have been", "won't", "haven't been", "am not"], "won't have been", 'Phủ định: will not have been + V-ing.'],
      ['He ___ living here for 10 years by 2027.', ["won't have been", "won't", "hasn't been", "isn't"], "won't have been", 'Chưa đủ thời lượng đến mốc tương lai.'],
      ['We ___ waiting long by 8 p.m.', ["won't have been", "won't", "haven't been", "aren't"], "won't have been", 'We dùng will not have been.'],
    ],
    question: [
      ['___ you have been studying long by next year?', ['Do', 'Will', 'Have', 'Are'], 'Will', 'Will + S + have been + V-ing?'],
      ['___ she have been working here for 10 years by then?', ['Does', 'Will', 'Has', 'Is'], 'Will', 'Câu hỏi Future Perfect Continuous dùng Will.'],
      ['___ they have been waiting long by 8 p.m.?', ['Do', 'Will', 'Have', 'Are'], 'Will', 'By 8 p.m. → will have been.'],
    ],
    'wh-question': [
      ['How long ___ you have been studying English by next year?', ['do', 'will', 'have', 'are'], 'will', 'How long will + S + have been + V-ing?'],
      ['How long ___ she have been working here by June?', ['does', 'will', 'has', 'is'], 'will', 'By June là mốc đo thời lượng.'],
      ['How long ___ they have been travelling by then?', ['do', 'will', 'have', 'are'], 'will', 'They vẫn dùng will have been.'],
    ],
  }),
]

export function getLocalQuizQuestions(lessonId: string): GrammarQuizBankItem[] {
  return grammarQuizBank.filter((item) => item.lesson_id === lessonId)
}

export function getLocalQuizQuestion(questionId: string): GrammarQuizBankItem | undefined {
  return grammarQuizBank.find((item) => item.id === questionId)
}
