export class ClassTime {
  id: number = 0;
  begin_time: string = '00:00';
  end_time: string = '00:00';
}

export class CourseData {
  id: number = -1;
  week: number = 0;
  name: string = 'TEST_NAME';
  location: string = 'TEST_LOCATION';
  teacher: string = 'TEST_TEACHER';
  weeks: string = 'TEST_WEEKS';
  week_day: number = 1;
  begin_time: number = 1;
  end_time: number = 1;

  constructor(
    id: number  = 0,
    week: number = 0,
    name: string = '',
    location: string = '',
    teacher: string = '',
    weeks: string = '',
    week_day: number = 0,
    begin_time: number = 0,
    end_time: number = 0) {
    this.id = id;
    this.week = week;
    this.name = name;
    this.location = location;
    this.teacher = teacher;
    this.weeks = weeks;
    this.week_day = week_day;
    this.begin_time = begin_time;
    this.end_time = end_time;
  }

  public toString(): string {
    return `CourseData{id: ${this.id}, week: ${this.week}, name: ${this.name}, location: ${this.location}, teacher: ${this.teacher}, weeks: ${this.weeks}, week_day: ${this.week_day}, begin_time: ${this.begin_time}, end_time: ${this.end_time}}`;
  }
}


