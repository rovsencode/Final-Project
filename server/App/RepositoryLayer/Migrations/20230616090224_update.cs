using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class update : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MovieRaiting_AspNetUsers_UserId1",
                table: "MovieRaiting");

            migrationBuilder.DropIndex(
                name: "IX_MovieRaiting_UserId1",
                table: "MovieRaiting");

            migrationBuilder.DropColumn(
                name: "UserId1",
                table: "MovieRaiting");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(964),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4730));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(1602),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(5438));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(433),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4146));

            migrationBuilder.AlterColumn<string>(
                name: "UserId",
                table: "MovieRaiting",
                type: "nvarchar(450)",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(9793),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(3423));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(8580),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(2304));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(7683),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(1529));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(1148),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 652, DateTimeKind.Utc).AddTicks(4975));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 21, DateTimeKind.Utc).AddTicks(4215),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 651, DateTimeKind.Utc).AddTicks(8257));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(2389),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(6080));

            migrationBuilder.CreateIndex(
                name: "IX_MovieRaiting_UserId",
                table: "MovieRaiting",
                column: "UserId");

            migrationBuilder.AddForeignKey(
                name: "FK_MovieRaiting_AspNetUsers_UserId",
                table: "MovieRaiting",
                column: "UserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_MovieRaiting_AspNetUsers_UserId",
                table: "MovieRaiting");

            migrationBuilder.DropIndex(
                name: "IX_MovieRaiting_UserId",
                table: "MovieRaiting");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4730),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(964));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Property",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(5438),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(1602));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(4146),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(433));

            migrationBuilder.AlterColumn<int>(
                name: "UserId",
                table: "MovieRaiting",
                type: "int",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(450)");

            migrationBuilder.AddColumn<string>(
                name: "UserId1",
                table: "MovieRaiting",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(3423),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(9793));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(2304),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(8580));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(1529),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(7683));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 652, DateTimeKind.Utc).AddTicks(4975),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 22, DateTimeKind.Utc).AddTicks(1148));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 651, DateTimeKind.Utc).AddTicks(8257),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 21, DateTimeKind.Utc).AddTicks(4215));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Comment",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 6, 16, 8, 23, 36, 653, DateTimeKind.Utc).AddTicks(6080),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 6, 16, 9, 2, 24, 23, DateTimeKind.Utc).AddTicks(2389));

            migrationBuilder.CreateIndex(
                name: "IX_MovieRaiting_UserId1",
                table: "MovieRaiting",
                column: "UserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_MovieRaiting_AspNetUsers_UserId1",
                table: "MovieRaiting",
                column: "UserId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
