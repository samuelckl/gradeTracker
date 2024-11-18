# Building80Coders
# 
# SwiftUI iphone app created by Abdullah Allabad, Mia Mao, Sam Kin Lok Chan

# App: Grade Tracker iOS App

![180](https://github.com/user-attachments/assets/347c1f7a-ad4f-45b9-8ae6-2b74dee868a5)


## Overview

Grade Tracker is an iOS app designed to help students effortlessly track their academic performance. The app allows students to manage their semesters, courses, and assignments, providing real-time insights into their progress towards achieving specific grade goals for each course.

With this app, students can:

- Add and manage multiple semesters.
- Track courses for each semester by adding details such as course title, credits, and desired grade goal.
- Add assignments for each course, specifying weight and marks achieved, helping students understand their progress towards their goal.

## Features

- Semester Management: Students can add and manage semesters for their academic year.
- Course Tracking: For each semester, students can add courses, specify course details, and set a grade goal.
- Assignment Tracking: For each course, students can track assignments by adding assignment details, such as weight and marks received.
- Progress Monitoring: The app automatically calculates how much students need to achieve in future assignments to meet their course goals.

> [!Note]
> When user add a new semester, they have to select the semester explicitly from the drop down menu before adding a new course.
> When user edits the course details, it will be updated in realtime and there is not any confirm button. User can click outside of the sheet or pull down the sheet to go back.

## App Structure and Code Modulation

The project is structured with a modular approach, using three key models:

1. Semester Model:
- Represents an academic semester.
- A semester can have multiple courses linked to it.

2. Course Model:
- Represents an individual course within a semester.
- For each course, students can specify:
    - Title: Name of the course.
    - Credits: The credit value of the course.
    - Goal: A desired grade goal that the student wants to achieve (e.g., Pass, Distinction, or HD).
- A course is linked to multiple assignments.

3. Assignment Model:
- Represents an individual assignment for a course.
- For each assignment, students can specify:
    - Title: Name of the assignment.
    - Weight: How much the assignment is worth towards the final grade.
    - Marks: The marks received for that specific assignment.
- The app calculates and tracks the total weight and marks achieved so far for each course.

## Structure:
- Model
    - Semester( id, title, startDate, isComplete)
    - Course( id, title, credits, goal)
    - Assignment( id, title, weight, startDate, mark)
- View
    - Component
        - CourseSummaryCardView - Show brief course summary and of assignments
        - ProgressDonutChart - Display progress as in a donut chart
        - NewAssignmentSheetView - To Create a new assignment
        - RowView - Display the courses summary 
    - ContentView - Load the landing view and display the mainView
    - MainView - Semester creation and picking
    - CourseView - Container to hold course summary and add assignment function
    - CourseListingView - List to show all courses
    - SemesterPickingView2 - Semester picker function
    - AddCourseView - To add new course
    - AddSemesterView - To add new semester
    - EditCourseView - Editing course information
    - EditAssignmentView - Editing assignment information: grades, etc.
    - LandingView - To show the logo before the mainview
- Assets
    - icon
    - Logo
 
## UI UX

- The UI has been implemented in a clean and easy way for student to use it, also created a simple but meaningful icon representing a target tracking process. Grade Tracker is implemented in the logo to make it recognizable.
- Colour scheme has been blue, the safe, comfortable feeling to clam student through their academic journey.
- San Franciso was used as its clear and readable for everyone and it is ios inbuilt that people can easily get familiar with this font.
- The UX has been modified and implemented in a way that user should be easily managed, the plus button to add new thing, the picker to choose semester, the swiping to edit assignments, and the customized donut chart to represent the progress, they are well developed in a way for student to easily pick up.
- There are instructions or prompts to help user understand the use of this app. 
      
## Flow:
- Semester → contains multiple Courses.
- Course → contains multiple Assignments.
- The app computes progress based on the weight and marks of assignments added to each course, helping students track how close they are to achieving their course goal.
