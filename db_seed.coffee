navList = new Meteor.Collection 'nav_list'
Questions = new Meteor.Collection 'questions'

collectionInit = () ->
  # navbar list collection
  if navList.find().count() == 0
    navs = [
      {title: 'Home', url: '/'}
      {title: 'Ask', url: '/ask'}
      {title: 'Questions', url: '/questions'}
      {title: 'Account', url: '/user'}
    ]
    for i in navs
      navList.insert(i)

  # seed questions collection
  if Questions.find().count() == 0
    seedQs = [
      {content: "What is your full name? Why did your parents select this name for you? Did you have a nickname?"}
      {content: "When and where were you born?"}
      {content: "How did your family come to live there?"}
      {content: "Were there other family members in the area? Who?"}
      {content: "What was the house (apartment, farm, etc.) like? How many rooms? Bathrooms? Did it have electricity? Indoor plumbing? Telephones?"}
      {content: "Were there any special items in the house that you remember?"}
      {content: "What is your earliest childhood memory?"}
      {content: "Describe the personalities of your family members."}
      {content: "What kind of games did you play growing up?"}
      {content: "What was your favorite toy and why?"}
      {content: "What was your favorite thing to do for fun (movies, beach, etc.)?"}
      {content: "Did you have family chores? What were they? Which was your least favorite?"}
      {content: "Did you receive an allowance? How much? Did you save your money or spend it?"}
      {content: "What was school like for you as a child? What were your best and worst subjects? Where did you attend grade school? High school? College?"}
      {content: "What school activities and sports did you participate in?"}
      {content: "Do you remember any fads from your youth? Popular hairstyles? Clothes?"}
      {content: "Who were your childhood heroes?"}
      {content: "What were your favorite songs and music?"}
      {content: "Did you have any pets? If so, what kind and what were their names?"}
      {content: "What was your religion growing up? What church, if any, did you attend?"}
      {content: "Were you ever mentioned in a newspaper?"}
      {content: "Who were your friends when you were growing up?"}
      {content: "What world events had the most impact on you while you were growing up? Did any of them personally affect your family?"}
      {content: "Describe a typical family dinner. Did you all eat together as a family? Who did the cooking? What were your favorite foods?"}
      {content: "How were holidays (birthdays, Christmas, etc.) celebrated in your family? Did your family have special traditions?"}
      {content: "How is the world today different from what it was like when you were a child?"}
      {content: "Who was the oldest relative you remember as a child? What do you remember about them?"}
      {content: "What do you know about your family surname?"}
      {content: "Is there a naming tradition in your family, such as always giving the firstborn son the name of his paternal grandfather?"}
      {content: "What stories have come down to you about your parents? Grandparents? More distant ancestors?"}
      {content: "Are there any stories about famous or infamous relatives in your family?"}
      {content: "Have any recipes been passed down to you from family members?"}
      {content: "Are there any physical characteristics that run in your family?"}
      {content: "Are there any special heirlooms, photos, bibles or other memorabilia that have been passed down in your family?"}
      {content: "What was the full name of your spouse? Siblings? Parents?"}
      {content: "When and how did you meet your spouse? What did you do on dates?"}
      {content: "What was it like when you proposed (or were proposed to)? Where and when did it happen? How did you feel?"}
      {content: "Where and when did you get married?"}
      {content: "What memory stands out the most from your wedding day?"}
      {content: "How would you describe your spouse? What do (did) you admire most about them?"}
      {content: "What do you believe is the key to a successful marriage?"}
      {content: "How did you find out your were going to be a parent for the first time?"}
      {content: "Why did you choose your children's names?"}
      {content: "What was your proudest moment as a parent?"}
      {content: "What did your family enjoy doing together?"}
      {content: "What was your profession and how did you choose it?"}
      {content: "If you could have had any other profession what would it have been? Why wasn't it your first choice?"}
      {content: "Of all the things you learned from your parents, which do you feel was the most valuable?"}
      {content: "What accomplishments were you the most proud of?"}
      {content: "What is the one thing you most want people to remember about you?"}
    ]
    for i in seedQs
      Questions.insert(i)
