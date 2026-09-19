export type TenseCategory = 'Present' | 'Past' | 'Future'

export interface GrammarExample {
  english: string
  vietnamese: string
}

export interface WritingExercise {
  id: string
  level: 1 | 2 | 3 | 4 | 5
  topic: string
  vietnamese: string
  acceptedAnswers: string[]
  explanation: string
}

export interface GrammarTense {
  id: string
  name: string
  nameVi: string
  category: TenseCategory
  level: string
  summary: string
  formula: {
    affirmative: string
    negative: string
    question: string
    whQuestion: string
  }
  uses: string[]
  signals: string[]
  examples: GrammarExample[]
  commonMistakes: { wrong: string; correct: string; reason: string }[]
  compareWith: string
  vocabulary: { english: string; vietnamese: string; example: string }[]
  writingExercises: WritingExercise[]
}

const daily: GrammarTense['vocabulary'] = [
  { english: 'go to school', vietnamese: 'đi học', example: 'I go to school by bike.' },
  { english: 'do homework', vietnamese: 'làm bài tập', example: 'I do my homework after dinner.' },
  { english: 'study English', vietnamese: 'học tiếng Anh', example: 'She studies English every day.' },
]

export const grammarTenses: GrammarTense[] = [
  {
    id: 'present-simple', name: 'Present Simple', nameVi: 'Thì hiện tại đơn', category: 'Present', level: 'A1-A2',
    summary: 'Dùng cho thói quen, sự thật và lịch trình cố định.',
    formula: { affirmative: 'S + V(s/es)', negative: 'S + do/does not + V', question: 'Do/Does + S + V?', whQuestion: 'Wh-word + do/does + S + V?' },
    uses: ['Thói quen hoặc việc lặp lại.', 'Sự thật, quy luật và trạng thái.', 'Lịch trình cố định như thời gian biểu.'],
    signals: ['always', 'usually', 'often', 'every day', 'sometimes', 'never'],
    examples: [
      { english: 'I go to school by bike every day.', vietnamese: 'Tôi đi học bằng xe đạp mỗi ngày.' },
      { english: 'Water boils at 100°C.', vietnamese: 'Nước sôi ở 100°C.' },
    ],
    commonMistakes: [{ wrong: 'She go to school.', correct: 'She goes to school.', reason: 'He/She/It cần động từ thêm -s hoặc -es.' }, { wrong: 'I am go to school.', correct: 'I go to school.', reason: 'Hiện tại đơn không dùng am/is/are trước động từ thường.' }],
    compareWith: 'Khác Present Continuous: Present Simple nói thói quen; Present Continuous nói việc đang xảy ra lúc nói.', vocabulary: daily,
    writingExercises: [{ id: 'ps-001', level: 1, topic: 'Daily Life', vietnamese: 'Tôi đi học mỗi ngày.', acceptedAnswers: ['I go to school every day.', 'I go to school daily.'], explanation: 'Đây là thói quen nên dùng Present Simple. Với chủ ngữ I, dùng go nguyên mẫu.' }, { id: 'ps-002', level: 2, topic: 'Family', vietnamese: 'Em gái tôi thường đọc sách sau bữa tối.', acceptedAnswers: ['My sister usually reads books after dinner.'], explanation: 'My sister là ngôi thứ ba số ít nên read thành reads.' }],
  },
  {
    id: 'present-continuous', name: 'Present Continuous', nameVi: 'Thì hiện tại tiếp diễn', category: 'Present', level: 'A2',
    summary: 'Dùng cho việc đang xảy ra hoặc kế hoạch gần trong tương lai.',
    formula: { affirmative: 'S + am/is/are + V-ing', negative: 'S + am/is/are not + V-ing', question: 'Am/Is/Are + S + V-ing?', whQuestion: 'Wh-word + am/is/are + S + V-ing?' },
    uses: ['Việc đang xảy ra ngay lúc nói.', 'Tình huống tạm thời.', 'Kế hoạch đã sắp xếp trong tương lai gần.'],
    signals: ['now', 'right now', 'at the moment', 'today', 'this week'],
    examples: [{ english: 'I am studying English now.', vietnamese: 'Bây giờ tôi đang học tiếng Anh.' }, { english: 'We are meeting our friends tonight.', vietnamese: 'Tối nay chúng tôi sẽ gặp bạn.' }],
    commonMistakes: [{ wrong: 'I studying English now.', correct: 'I am studying English now.', reason: 'Cần có động từ be trước V-ing.' }, { wrong: 'She is study now.', correct: 'She is studying now.', reason: 'Sau is/am/are phải dùng động từ thêm -ing.' }],
    compareWith: 'Khác Present Simple: dùng am/is/are + V-ing cho việc đang diễn ra, không dùng V nguyên mẫu.', vocabulary: daily,
    writingExercises: [{ id: 'pc-001', level: 1, topic: 'Study', vietnamese: 'Tôi đang học tiếng Anh bây giờ.', acceptedAnswers: ['I am studying English now.', "I'm studying English now."], explanation: 'Now báo hiệu hành động đang xảy ra, dùng am + studying.' }],
  },
  {
    id: 'present-perfect', name: 'Present Perfect', nameVi: 'Thì hiện tại hoàn thành', category: 'Present', level: 'B1',
    summary: 'Nối một việc trong quá khứ với hiện tại: kinh nghiệm, kết quả hoặc khoảng thời gian chưa kết thúc.',
    formula: { affirmative: 'S + have/has + V3', negative: 'S + have/has not + V3', question: 'Have/Has + S + V3?', whQuestion: 'Wh-word + have/has + S + V3?' },
    uses: ['Kinh nghiệm đến hiện tại.', 'Việc vừa hoàn thành và có kết quả hiện tại.', 'Việc bắt đầu trong quá khứ và vẫn còn liên quan hiện tại.'],
    signals: ['already', 'just', 'yet', 'ever', 'never', 'since', 'for', 'recently'],
    examples: [{ english: 'I have finished my homework.', vietnamese: 'Tôi đã làm xong bài tập.' }, { english: 'She has lived here since 2020.', vietnamese: 'Cô ấy đã sống ở đây từ năm 2020.' }],
    commonMistakes: [{ wrong: 'I have went there.', correct: 'I have gone there.', reason: 'Sau have/has phải dùng quá khứ phân từ V3.' }, { wrong: 'I went there since 2020.', correct: 'I have lived there since 2020.', reason: 'Since + mốc thời gian kéo dài đến hiện tại dùng Present Perfect.' }],
    compareWith: 'Khác Past Simple: Present Perfect không nhấn vào thời điểm đã kết thúc; Past Simple thường đi với yesterday, last year hoặc một thời điểm cụ thể.', vocabulary: [{ english: 'have experience', vietnamese: 'có kinh nghiệm', example: 'I have had this experience before.' }, ...daily],
    writingExercises: [{ id: 'pp-001', level: 2, topic: 'Study', vietnamese: 'Tôi đã hoàn thành bài tập của mình.', acceptedAnswers: ['I have finished my homework.', 'I have completed my homework.'], explanation: 'Hành động vừa hoàn thành và kết quả còn ở hiện tại, dùng have + V3.' }],
  },
  {
    id: 'present-perfect-continuous', name: 'Present Perfect Continuous', nameVi: 'Thì hiện tại hoàn thành tiếp diễn', category: 'Present', level: 'B2',
    summary: 'Nhấn mạnh một hoạt động bắt đầu trong quá khứ và kéo dài liên tục đến hiện tại hoặc vừa mới dừng.',
    formula: { affirmative: 'S + have/has been + V-ing', negative: 'S + have/has not been + V-ing', question: 'Have/Has + S + been + V-ing?', whQuestion: 'How long + have/has + S + been + V-ing?' },
    uses: ['Nhấn mạnh thời lượng.', 'Hoạt động kéo dài và có dấu hiệu/kết quả hiện tại.'],
    signals: ['for', 'since', 'all day', 'recently', 'lately', 'how long'],
    examples: [{ english: 'I have been studying for two hours.', vietnamese: 'Tôi đã học được hai tiếng.' }, { english: 'She is tired because she has been working all day.', vietnamese: 'Cô ấy mệt vì đã làm việc cả ngày.' }],
    commonMistakes: [{ wrong: 'I have studying for two hours.', correct: 'I have been studying for two hours.', reason: 'Cấu trúc cần have/has been + V-ing.' }],
    compareWith: 'Present Perfect nhấn mạnh kết quả; Present Perfect Continuous nhấn mạnh quá trình và thời lượng.', vocabulary: [{ english: 'practice regularly', vietnamese: 'luyện tập thường xuyên', example: 'He has been practising regularly.' }, { english: 'work hard', vietnamese: 'làm việc chăm chỉ', example: 'They have been working hard.' }],
    writingExercises: [{ id: 'ppc-001', level: 3, topic: 'Study', vietnamese: 'Tôi đã học tiếng Anh được ba năm.', acceptedAnswers: ['I have been studying English for three years.', 'I have studied English for three years.'], explanation: 'For + khoảng thời gian và nhấn mạnh quá trình nên dùng have been studying.' }],
  },
  {
    id: 'past-simple', name: 'Past Simple', nameVi: 'Thì quá khứ đơn', category: 'Past', level: 'A2',
    summary: 'Dùng cho hành động đã xảy ra và kết thúc trong quá khứ.',
    formula: { affirmative: 'S + V2/ed', negative: 'S + did not + V', question: 'Did + S + V?', whQuestion: 'Wh-word + did + S + V?' },
    uses: ['Hành động đã kết thúc.', 'Chuỗi sự kiện trong quá khứ.', 'Thói quen hoặc trạng thái trong quá khứ.'],
    signals: ['yesterday', 'last week', 'ago', 'in 2020', 'when I was young'],
    examples: [{ english: 'I went to school yesterday.', vietnamese: 'Hôm qua tôi đã đi học.' }, { english: 'We watched a film last night.', vietnamese: 'Tối qua chúng tôi đã xem phim.' }],
    commonMistakes: [{ wrong: 'I did not went.', correct: 'I did not go.', reason: 'Sau did/did not dùng động từ nguyên mẫu.' }],
    compareWith: 'Khác Present Perfect: Past Simple đi với thời điểm quá khứ đã kết thúc.', vocabulary: [{ english: 'watch a film', vietnamese: 'xem phim', example: 'We watched a film last night.' }, ...daily],
    writingExercises: [{ id: 'pas-001', level: 1, topic: 'Daily Life', vietnamese: 'Hôm qua tôi đã đi học.', acceptedAnswers: ['I went to school yesterday.'], explanation: 'Yesterday là dấu hiệu của Past Simple; go có dạng quá khứ là went.' }],
  },
  {
    id: 'past-continuous', name: 'Past Continuous', nameVi: 'Thì quá khứ tiếp diễn', category: 'Past', level: 'B1',
    summary: 'Dùng cho việc đang diễn ra tại một thời điểm trong quá khứ hoặc bị một việc khác xen vào.',
    formula: { affirmative: 'S + was/were + V-ing', negative: 'S + was/were not + V-ing', question: 'Was/Were + S + V-ing?', whQuestion: 'What + was/were + S + V-ing?' },
    uses: ['Đang diễn ra tại một thời điểm quá khứ.', 'Một hành động dài bị hành động ngắn xen vào.', 'Hai hành động diễn ra song song.'],
    signals: ['at 8 p.m. yesterday', 'while', 'when', 'at that time'],
    examples: [{ english: 'I was studying when you called.', vietnamese: 'Tôi đang học thì bạn gọi.' }, { english: 'They were playing football at 5 p.m.', vietnamese: 'Họ đang chơi bóng lúc 5 giờ chiều.' }],
    commonMistakes: [{ wrong: 'I studied when you called.', correct: 'I was studying when you called.', reason: 'Hành động đang diễn ra bị xen vào dùng was/were + V-ing.' }],
    compareWith: 'Past Simple kể sự kiện; Past Continuous tạo bối cảnh hoặc mô tả hành động đang diễn ra.', vocabulary: [{ english: 'play football', vietnamese: 'chơi bóng đá', example: 'They were playing football.' }, { english: 'make dinner', vietnamese: 'nấu bữa tối', example: 'I was making dinner.' }],
    writingExercises: [{ id: 'pasc-001', level: 2, topic: 'Technology', vietnamese: 'Tôi đang dùng điện thoại khi mẹ gọi.', acceptedAnswers: ['I was using my phone when my mother called.', 'I was using my phone when my mom called.'], explanation: 'Hành động dài dùng Past Continuous; sự kiện xen vào dùng Past Simple.' }],
  },
  {
    id: 'past-perfect', name: 'Past Perfect', nameVi: 'Thì quá khứ hoàn thành', category: 'Past', level: 'B2',
    summary: 'Dùng cho hành động xảy ra trước một hành động khác trong quá khứ.',
    formula: { affirmative: 'S + had + V3', negative: 'S + had not + V3', question: 'Had + S + V3?', whQuestion: 'What had + S + V3?' },
    uses: ['Làm rõ hành động xảy ra trước trong câu chuyện quá khứ.', 'Nguyên nhân đã xảy ra trước một kết quả quá khứ.'],
    signals: ['before', 'after', 'by the time', 'already', 'when'],
    examples: [{ english: 'I had finished my homework before dinner.', vietnamese: 'Tôi đã làm xong bài tập trước bữa tối.' }, { english: 'The train had left when we arrived.', vietnamese: 'Tàu đã rời đi khi chúng tôi đến.' }],
    commonMistakes: [{ wrong: 'When I arrived, the train left.', correct: 'When I arrived, the train had left.', reason: 'Tàu rời đi trước, nên dùng Past Perfect để làm rõ thứ tự.' }],
    compareWith: 'Past Simple mô tả các việc đã xảy ra; Past Perfect nhấn mạnh việc xảy ra trước một mốc quá khứ khác.', vocabulary: [{ english: 'arrive at the station', vietnamese: 'đến nhà ga', example: 'We arrived at the station late.' }, { english: 'leave early', vietnamese: 'rời đi sớm', example: 'The bus had left early.' }],
    writingExercises: [{ id: 'pap-001', level: 3, topic: 'Travel', vietnamese: 'Tàu đã rời đi trước khi chúng tôi đến.', acceptedAnswers: ['The train had left before we arrived.', 'The train had left when we arrived.'], explanation: 'Hành động rời đi xảy ra trước hành động đến, dùng had + V3.' }],
  },
  {
    id: 'past-perfect-continuous', name: 'Past Perfect Continuous', nameVi: 'Thì quá khứ hoàn thành tiếp diễn', category: 'Past', level: 'C1',
    summary: 'Nhấn mạnh thời lượng của một hoạt động kéo dài trước một mốc trong quá khứ.',
    formula: { affirmative: 'S + had been + V-ing', negative: 'S + had not been + V-ing', question: 'Had + S + been + V-ing?', whQuestion: 'How long had + S + been + V-ing?' },
    uses: ['Hoạt động kéo dài liên tục trước một sự kiện quá khứ.', 'Giải thích nguyên nhân của trạng thái trong quá khứ.'],
    signals: ['for', 'since', 'before', 'until then', 'all day'],
    examples: [{ english: 'She had been studying for hours before the exam.', vietnamese: 'Cô ấy đã học hàng giờ trước kỳ thi.' }, { english: 'He was tired because he had been running.', vietnamese: 'Anh ấy mệt vì đã chạy bộ.' }],
    commonMistakes: [{ wrong: 'She had studying for hours.', correct: 'She had been studying for hours.', reason: 'Cần had been + V-ing để nhấn mạnh quá trình.' }],
    compareWith: 'Past Perfect nhấn mạnh kết quả; Past Perfect Continuous nhấn mạnh thời lượng và quá trình trước một mốc quá khứ.', vocabulary: [{ english: 'prepare for an exam', vietnamese: 'chuẩn bị cho kỳ thi', example: 'She had been preparing for the exam.' }, { english: 'feel tired', vietnamese: 'cảm thấy mệt', example: 'He felt tired.' }],
    writingExercises: [{ id: 'papc-001', level: 4, topic: 'Study', vietnamese: 'Cô ấy đã học nhiều giờ trước khi làm bài kiểm tra.', acceptedAnswers: ['She had been studying for hours before taking the test.', 'She had been studying for hours before the test.'], explanation: 'For hours nhấn mạnh thời lượng trước một mốc trong quá khứ.' }],
  },
  {
    id: 'future-simple', name: 'Future Simple', nameVi: 'Thì tương lai đơn', category: 'Future', level: 'A2',
    summary: 'Dùng cho quyết định nhanh, dự đoán và lời hứa trong tương lai.',
    formula: { affirmative: 'S + will + V', negative: 'S + will not + V', question: 'Will + S + V?', whQuestion: 'Wh-word + will + S + V?' },
    uses: ['Quyết định tại thời điểm nói.', 'Dự đoán hoặc ý kiến về tương lai.', 'Lời hứa, đề nghị và lời mời.'],
    signals: ['tomorrow', 'next week', 'soon', 'I think', 'probably'],
    examples: [{ english: 'I will call you tonight.', vietnamese: 'Tối nay tôi sẽ gọi cho bạn.' }, { english: 'I think it will rain tomorrow.', vietnamese: 'Tôi nghĩ ngày mai trời sẽ mưa.' }],
    commonMistakes: [{ wrong: 'I will to call you.', correct: 'I will call you.', reason: 'Sau will dùng động từ nguyên mẫu không có to.' }],
    compareWith: 'Be going to thường dùng cho kế hoạch hoặc dự đoán có bằng chứng; will dùng cho quyết định nhanh, lời hứa hoặc ý kiến.', vocabulary: [{ english: 'call someone', vietnamese: 'gọi cho ai', example: 'I will call you later.' }, { english: 'make a promise', vietnamese: 'hứa', example: 'I will help you.' }],
    writingExercises: [{ id: 'fs-001', level: 1, topic: 'Friends', vietnamese: 'Tôi sẽ gọi cho bạn tối nay.', acceptedAnswers: ['I will call you tonight.', "I'll call you tonight."], explanation: 'Will + động từ nguyên mẫu dùng cho lời hứa hoặc quyết định về tương lai.' }],
  },
  {
    id: 'future-continuous', name: 'Future Continuous', nameVi: 'Thì tương lai tiếp diễn', category: 'Future', level: 'B2',
    summary: 'Dùng cho việc sẽ đang diễn ra tại một thời điểm cụ thể trong tương lai.',
    formula: { affirmative: 'S + will be + V-ing', negative: 'S + will not be + V-ing', question: 'Will + S + be + V-ing?', whQuestion: 'What will + S + be + V-ing?' },
    uses: ['Đang diễn ra tại một thời điểm tương lai.', 'Hỏi lịch sự về kế hoạch của người khác.'],
    signals: ['this time tomorrow', 'at 8 p.m. tomorrow', 'next week at this time'],
    examples: [{ english: 'This time tomorrow, I will be flying to London.', vietnamese: 'Giờ này ngày mai tôi sẽ đang bay đến London.' }, { english: 'Will you be using your laptop tonight?', vietnamese: 'Tối nay bạn sẽ dùng máy tính xách tay chứ?' }],
    commonMistakes: [{ wrong: 'I will studying tomorrow.', correct: 'I will be studying tomorrow.', reason: 'Cấu trúc cần will be + V-ing.' }],
    compareWith: 'Future Simple nói một việc sẽ xảy ra; Future Continuous nhấn mạnh việc đang diễn ra tại một thời điểm tương lai.', vocabulary: [{ english: 'fly to a city', vietnamese: 'bay đến một thành phố', example: 'I will be flying to London.' }, { english: 'use a laptop', vietnamese: 'dùng laptop', example: 'She will be using her laptop.' }],
    writingExercises: [{ id: 'fc-001', level: 3, topic: 'Travel', vietnamese: 'Giờ này ngày mai tôi sẽ đang đi du lịch.', acceptedAnswers: ['This time tomorrow, I will be travelling.', 'This time tomorrow, I will be traveling.'], explanation: 'This time tomorrow cho biết một hành động đang diễn ra tại thời điểm tương lai.' }],
  },
  {
    id: 'future-perfect', name: 'Future Perfect', nameVi: 'Thì tương lai hoàn thành', category: 'Future', level: 'B2',
    summary: 'Dùng cho việc sẽ hoàn thành trước một thời điểm trong tương lai.',
    formula: { affirmative: 'S + will have + V3', negative: 'S + will not have + V3', question: 'Will + S + have + V3?', whQuestion: 'When will + S + have + V3?' },
    uses: ['Hoàn thành trước một mốc tương lai.', 'Dự đoán rằng một việc sẽ xong vào thời điểm đó.'],
    signals: ['by tomorrow', 'by next year', 'by the time', 'before'],
    examples: [{ english: 'By Friday, I will have finished the project.', vietnamese: 'Đến thứ Sáu, tôi sẽ hoàn thành dự án.' }, { english: 'She will have graduated by 2028.', vietnamese: 'Cô ấy sẽ tốt nghiệp trước năm 2028.' }],
    commonMistakes: [{ wrong: 'I will have finish the project.', correct: 'I will have finished the project.', reason: 'Sau have cần dùng V3.' }],
    compareWith: 'Future Perfect nhấn mạnh kết quả đã hoàn thành; Future Continuous nhấn mạnh quá trình đang diễn ra.', vocabulary: [{ english: 'finish a project', vietnamese: 'hoàn thành dự án', example: 'I will have finished the project.' }, { english: 'graduate from university', vietnamese: 'tốt nghiệp đại học', example: 'She will have graduated.' }],
    writingExercises: [{ id: 'fp-001', level: 4, topic: 'Work', vietnamese: 'Đến thứ Sáu, tôi sẽ hoàn thành báo cáo.', acceptedAnswers: ['By Friday, I will have finished the report.', 'I will have finished the report by Friday.'], explanation: 'By + mốc tương lai cho biết hành động sẽ hoàn thành trước mốc đó.' }],
  },
  {
    id: 'future-perfect-continuous', name: 'Future Perfect Continuous', nameVi: 'Thì tương lai hoàn thành tiếp diễn', category: 'Future', level: 'C1',
    summary: 'Nhấn mạnh thời lượng một hoạt động sẽ kéo dài đến một mốc trong tương lai.',
    formula: { affirmative: 'S + will have been + V-ing', negative: 'S + will not have been + V-ing', question: 'Will + S + have been + V-ing?', whQuestion: 'How long will + S + have been + V-ing?' },
    uses: ['Nhấn mạnh khoảng thời gian kéo dài đến một mốc tương lai.', 'Mô tả quá trình liên tục trong dự đoán dài hạn.'],
    signals: ['for ... by', 'by next month', 'by the end of the year'],
    examples: [{ english: 'By June, I will have been studying English for five years.', vietnamese: 'Đến tháng Sáu, tôi sẽ học tiếng Anh được năm năm.' }],
    commonMistakes: [{ wrong: 'I will have studying for five years.', correct: 'I will have been studying for five years.', reason: 'Cấu trúc đầy đủ là will have been + V-ing.' }],
    compareWith: 'Future Perfect nói việc sẽ hoàn thành; Future Perfect Continuous nói thời lượng quá trình đến mốc tương lai.', vocabulary: [{ english: 'study consistently', vietnamese: 'học đều đặn', example: 'I will have been studying consistently.' }, { english: 'work in a field', vietnamese: 'làm việc trong một lĩnh vực', example: 'He will have been working in the field for ten years.' }],
    writingExercises: [{ id: 'fpc-001', level: 5, topic: 'Education', vietnamese: 'Đến năm sau, tôi sẽ học tiếng Anh được năm năm.', acceptedAnswers: ['By next year, I will have been studying English for five years.'], explanation: 'For five years nhấn mạnh thời lượng kéo dài đến một mốc tương lai.' }],
  },
]

export const tenseCategories: TenseCategory[] = ['Present', 'Past', 'Future']
