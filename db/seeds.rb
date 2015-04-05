# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

# Build schools from JSON
schools_json = JSON.parse(File.read(Rails.root.join('public', 'gf_world_schools.json').to_s))

schools = schools_json.map { |school| SchoolAccount.new(name: school) }

SchoolAccount.import schools, validate: false

# AdminUser.create!(:email => 'admin@example.com', :password => 'password', :password_confirmation => 'password')
# professor_one = User.create!(name: "Michael Bluth", email: "bluth@bluth.com", password: "password")
#
# student_one = User.create!(name: "Maebe Funke", email: "maebe@bluth.com", password: "password")
# student_two = User.create!(name: "George-Michael Bluth", email: "georgemichael@bluth.com", password: "password")
# student_three = User.create!(name: "Steve Holt", email: "steve@bluth.com", password: "password")
#
# course_one = Course.create!(
#   name: "Calculus Bridge - Pass I",
#   description: "In the first pass, students learn the four components of Calculus:
# functions, limits, derivatives, and integrals. The focus is on gaining
# a conceptual understanding of these core components and how they
# interconnect, while learning basic techniques for polynomial
# functions.",
#   subject: "MATH",
#   course_number: 1001,
#   course_registration_number: 12345,
#   semester: "Fall",
#   year: 2014,
#   spots_available: 420,
#   credits: 0,
#   instructor: professor_one)
#   c1 = Capsule.create!(name: "Functions", course: course_one)
#     Lecture.create!(name: "Equations of Lines", lecture_number: 1, capsule: c1)
#     Lecture.create!(name: "Polynomials", lecture_number: 2, capsule: c1)
#     Lecture.create!(name: "Composite and Inverse Functions", lecture_number: 3, capsule: c1)
#     Lecture.create!(name: "Piecewise Functions", lecture_number: 4, capsule: c1)
#     Lecture.create!(name: "The Difference Quotient", lecture_number: 5, capsule: c1)
#     Lecture.create!(name: "The Accumulation Function", lecture_number: 6, capsule: c1)
#   c2 = Capsule.create!(name: "Limits", course: course_one)
#     Lecture.create!(name: "Description of a Limit", lecture_number: 1, capsule: c2)
#     lecture = Lecture.create!(
#                 name: "Left and Right Hand Limits",
#                 lecture_number: 2,
#                 capsule: c2)
#     lecture.videos.create!(title: "Fun Vid", mediasite_url: "https://mediasite.mms.rpi.edu/Mediasite5/Play/0630c92605a646f7ae817552ab9763ca1d")
#     Lecture.create!(name: "Continuity", lecture_number: 3, capsule: c2)
#     Lecture.create!(name: "Limits at Infinity", lecture_number: 4, capsule: c2)
#   c3 = Capsule.create!(name: "Derivatives", course: course_one)
#     lecture = Lecture.create!(
#                 name: "Definition of a Derivative",
#                 lecture_number: 1,
#                 capsule: c3)
#     lecture.videos.create!(title: "Fun Vid", mediasite_url: "http://mediasite.mms.rpi.edu/Mediasite5/Play/24211bff372b455c92d9fe2a4fe35c3c1d")
#     Lecture.create!(name: "Derivative as a Function", lecture_number: 2, capsule: c3)
#     Lecture.create!(name: "Basic Rules", lecture_number: 3, capsule: c3)
#     Lecture.create!(name: "Notation and Higher Derivatives", lecture_number: 4, capsule: c3)
#     Lecture.create!(name: "Product Rule", lecture_number: 5, capsule: c3)
#     Lecture.create!(name: "Reciprocal Rule", lecture_number: 6, capsule: c3)
#     Lecture.create!(name: "Chain Rule", lecture_number: 7, capsule: c3)
#     Lecture.create!(name: "Derivatives of Inverse Functions", lecture_number: 8, capsule: c3)
#   c4 = Capsule.create!(name: "Integrals",
#                        description: "We're gonna antiderive some functions to get from one level of derivation to the one above it. I know this isn't typical math professor speak, and that's because I'm not actually a math professor. I'm a college student going to RPI. And I do well at math, but I don't really understand anything I'm doing. I just plug stuff in and it works out in the end. Thanks Newton.",
#                        course: course_one)
#     Lecture.create!(name: "Sums of a Rectangle",
#                     description: "Finding the sum of rectangles using integrals. No calculators either, it'll all be by hand. Won't this be fun??",
#                     lecture_number: 1,
#                     capsule: c4)
#     Lecture.create!(name: "Summation Notation", lecture_number: 2, capsule: c4)
#     Lecture.create!(name: "Right Sums", lecture_number: 3, capsule: c4)
#     Lecture.create!(name: "Definite Integral", lecture_number: 4, capsule: c4)
#     Lecture.create!(name: "Accumulation Functions", lecture_number: 5, capsule: c4)
#     Lecture.create!(name: "Fundamental Theorem of Calculus", lecture_number: 6, capsule: c4)
#     Lecture.create!(name: "Anti-Derivatives/Indefinite Integrals", lecture_number: 7, capsule: c4)
#     Lecture.create!(name: "U-Substitution", lecture_number: 8, capsule: c4)
#
# course_two = Course.create!(
#   name: "Calculus Bridge - Pass II",
#   description: "In the second pass, students focus on limits, derivatives, and
# integrals, as well as rational functions, trigonometric functions,
# logarithms and exponentials. More techniques and applications are
# developed so that students have the tools they need to use Calculus in
# other subjects.",
#   subject: "MATH",
#   course_number: 1001,
#   course_registration_number: 23456,
#   semester: "Fall",
#   year: 2014,
#   spots_available: 420,
#   credits: 0,
#   instructor: professor_one)
#   c5 = Capsule.create!(name: "Rational Functions", course: course_two)
#     Lecture.create!(name: "Limits at Infinity", lecture_number: 1, capsule: c5)
#     Lecture.create!(name: "Infinite Limits", lecture_number: 2, capsule: c5)
#     Lecture.create!(name: "Derivatives (Quotient Rule)", lecture_number: 3, capsule: c5)
#     Lecture.create!(name: "Integrals", lecture_number: 4, capsule: c5)
#   c6 = Capsule.create!(name: "Trigonometric Functions", course: course_two)
#     Lecture.create!(name: "Basic Trigonometry", lecture_number: 1, capsule: c6)
#     Lecture.create!(name: "Trigonometric Identities", lecture_number: 2, capsule: c6)
#     Lecture.create!(name: "Inverse Trigonometric Functions", lecture_number: 3, capsule: c6)
#     Lecture.create!(name: "Derivatives of Trigonometric Functions", lecture_number: 4, capsule: c6)
#     Lecture.create!(name: "Derivatives of Inverse Trigonometric Functions", lecture_number: 5, capsule: c6)
#     Lecture.create!(name: "Integrals of Trigonometric Functions", lecture_number: 6, capsule: c6)
#     Lecture.create!(name: "Integrals using Inverse Trigonometric Functions", lecture_number: 7, capsule: c6)
#   c7 = Capsule.create!(name: "Exponentials and Logarithms", course: course_two)
#     Lecture.create!(name: "Exponential Rules", lecture_number: 1, capsule: c7)
#     Lecture.create!(name: "Logarithms and Rules", lecture_number: 2, capsule: c7)
#     Lecture.create!(name: "Definition of e", lecture_number: 3, capsule: c7)
#     Lecture.create!(name: "Derivatives of Logarithms", lecture_number: 4, capsule: c7)
#     Lecture.create!(name: "Logarithmic Differentiation", lecture_number: 5, capsule: c7)
#     Lecture.create!(name: "Integrals Using Logarithms", lecture_number: 6, capsule: c7)
#   c8 = Capsule.create!(name: "Applications", course: course_two)
#     Lecture.create!(name: "L'Hopital's Rule", lecture_number: 1, capsule: c8)
#     Lecture.create!(name: "Related Rates", lecture_number: 2, capsule: c8)
#     Lecture.create!(name: "Monotonicity", lecture_number: 3, capsule: c8)
#     Lecture.create!(name: "Concavity", lecture_number: 4, capsule: c8)
#     Lecture.create!(name: "Maximums and Minimums", lecture_number: 5, capsule: c8)
#     Lecture.create!(name: "Areas", lecture_number: 6, capsule: c8)
#
# course_three = Course.create!(
#   name: "Calculus Bridge - Pass III",
#   description: "In the third and final pass, students study the deeper theoretical
# underpinnings of Calculus. Limits, derivatives, and integrals are
# presented in a more mathematically rigorous context so as to provide a
# richer view of the Calculus and cement student understanding.",
#   subject: "MATH",
#   course_number: 1001,
#   course_registration_number: 34567,
#   semester: "Fall",
#   year: 2014,
#   spots_available: 420,
#   credits: 0,
#   instructor: professor_one)
#   c9 = Capsule.create!(name: "Limits and Continuity", course: course_three)
#     Lecture.create!(name: "Precise Definition of a Limit", lecture_number: 1, capsule: c9)
#     Lecture.create!(name: "Formal Limit Laws", lecture_number: 2, capsule: c9)
#     Lecture.create!(name: "Precise Definition of a Limit at Infinity", lecture_number: 3, capsule: c9)
#     Lecture.create!(name: "Continuity Revisited", lecture_number: 4, capsule: c9)
#     Lecture.create!(name: "Intermediate Value Theorem", lecture_number: 5, capsule: c9)
#     Lecture.create!(name: "Continuous Functions on Bounded Intervals", lecture_number: 6, capsule: c9)
#   c10 = Capsule.create!(name: "Derivatives", course: course_three)
#     Lecture.create!(name: "Differentiability", lecture_number: 1, capsule: c10)
#     Lecture.create!(name: "Proof of Product/Quotient Rules", lecture_number: 2, capsule: c10)
#     Lecture.create!(name: "Proof of Chain Rule", lecture_number: 3, capsule: c10)
#     Lecture.create!(name: "Proof of rule for Trigonometric Functions", lecture_number: 4, capsule: c10)
#     Lecture.create!(name: "Proof of rules for Logarithms/Exponents", lecture_number: 5, capsule: c10)
#     Lecture.create!(name: "The Power Rule Revisited", lecture_number: 6, capsule: c10)
#     Lecture.create!(name: "List of Derivative Rules", lecture_number: 7, capsule: c10)
#     Lecture.create!(name: "The Mean Value THeorem (MVT)", lecture_number: 8, capsule: c10)
#     Lecture.create!(name: "The MVT and Monotonicity", lecture_number: 9, capsule: c10)
#   c11 = Capsule.create!(name: "Integrals", course: course_three)
#     Lecture.create!(name: "Left and Middle Sums", lecture_number: 1, capsule: c11)
#     Lecture.create!(name: "Riemann Sums", lecture_number: 2, capsule: c11)
#     Lecture.create!(name: "The Definition of the Riemann Integral", lecture_number: 3, capsule: c11)
#     Lecture.create!(name: "Properties of the Riemann Integral", lecture_number: 4, capsule: c11)
#     Lecture.create!(name: "Ingegrable Functions", lecture_number: 5, capsule: c11)
#   c12 = Capsule.create!(name: "The Fundamental Theorem", course: course_three)
#     Lecture.create!(name: "Proof of FTC: Part I", lecture_number: 1, capsule: c12)
#     Lecture.create!(name: "Proof of FTC: Part II", lecture_number: 2, capsule: c12)
#
# =begin
# course_four = Course.create!(
#   name: "Computer Science I",
#   description: "An introduction to computer programming algorithm design and
# analysis. Additional topics include basic computer organization;
# internal representation of scalar and array data; use of top-down
# design and subprograms to tackle complex problems; abstract data
# types. Enrichment material as time allows. Interdisciplinary case
# studies, numerical and nonnumerical applications.",
#   subject: "CSCI",
#   course_number: 1100,
#   course_registration_number: 101010,
#   semester: "Fall",
#   year: 2014,
#   spots_available: 420,
#   credits: 4,
#   instructor: professor_one)
# =end
#
# CourseUser.create!(course: course_one, user: student_one)
# CourseUser.create!(course: course_one, user: student_two)
# CourseUser.create!(course: course_one, user: student_three)
# CourseUser.create!(course: course_two, user: student_one)
# CourseUser.create!(course: course_two, user: student_two)
# CourseUser.create!(course: course_two, user: student_three)
# CourseUser.create!(course: course_three, user: student_one)
# CourseUser.create!(course: course_three, user: student_two)
# CourseUser.create!(course: course_three, user: student_three)
