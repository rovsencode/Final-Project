using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace RepositoryLayer.Migrations
{
    public partial class editFeatureTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5353),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 695, DateTimeKind.Utc).AddTicks(6320));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(1016),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 694, DateTimeKind.Utc).AddTicks(7438));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(380),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 694, DateTimeKind.Utc).AddTicks(6393));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5834),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 695, DateTimeKind.Utc).AddTicks(7300));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(9843),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 694, DateTimeKind.Utc).AddTicks(5269));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(4629),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 693, DateTimeKind.Utc).AddTicks(4406));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(893),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 692, DateTimeKind.Utc).AddTicks(2525));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9985),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 692, DateTimeKind.Utc).AddTicks(632));

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "Feature",
                type: "nvarchar(500)",
                maxLength: 500,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(100)",
                oldMaxLength: 100);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9562),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 691, DateTimeKind.Utc).AddTicks(9815));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(4624),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 691, DateTimeKind.Utc).AddTicks(895));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(161),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 689, DateTimeKind.Utc).AddTicks(2855));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(9618),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 689, DateTimeKind.Utc).AddTicks(1283));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(4073),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 686, DateTimeKind.Utc).AddTicks(4034));
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Social",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 695, DateTimeKind.Utc).AddTicks(6320),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5353));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Serie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 694, DateTimeKind.Utc).AddTicks(7438),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(1016));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Season",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 694, DateTimeKind.Utc).AddTicks(6393),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(380));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Quality",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 695, DateTimeKind.Utc).AddTicks(7300),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 161, DateTimeKind.Utc).AddTicks(5834));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "PricingPlans",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 694, DateTimeKind.Utc).AddTicks(5269),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(9843));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Partners",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 693, DateTimeKind.Utc).AddTicks(4406),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(4629));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Movie",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 692, DateTimeKind.Utc).AddTicks(2525),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 160, DateTimeKind.Utc).AddTicks(893));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Genre",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 692, DateTimeKind.Utc).AddTicks(632),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9985));

            migrationBuilder.AlterColumn<string>(
                name: "Description",
                table: "Feature",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(500)",
                oldMaxLength: 500);

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Feature",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 691, DateTimeKind.Utc).AddTicks(9815),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(9562));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Faq",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 691, DateTimeKind.Utc).AddTicks(895),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(4624));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Episode",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 689, DateTimeKind.Utc).AddTicks(2855),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 159, DateTimeKind.Utc).AddTicks(161));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Contact",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 689, DateTimeKind.Utc).AddTicks(1283),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(9618));

            migrationBuilder.AlterColumn<DateTime>(
                name: "CreatedTime",
                table: "Actress",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(2023, 5, 16, 9, 30, 22, 686, DateTimeKind.Utc).AddTicks(4034),
                oldClrType: typeof(DateTime),
                oldType: "datetime2",
                oldDefaultValue: new DateTime(2023, 5, 17, 17, 16, 45, 158, DateTimeKind.Utc).AddTicks(4073));
        }
    }
}
